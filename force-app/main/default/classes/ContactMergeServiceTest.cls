@isTest(seeAllData=false)
private class ContactMergeServiceTest {
    @isTest
    static void testInsertNewContact() {
        Contact payload = new Contact(LastName='Nuovo', Legacy_Id__c='LEGACY-001');
        ContactMergeService.MergeReport report = ContactMergeService.mergeContacts(new List<Contact>{payload});
        System.assertEquals(1, report.getProcessedCount());
        System.assertEquals(0, report.getWarningCount());
        System.assert(report.results[0].isSuccess);
        Contact stored = [SELECT Id, LastName FROM Contact WHERE Legacy_Id__c='LEGACY-001' LIMIT 1];
        System.assertEquals('Nuovo', stored.LastName);
    }

    @isTest
    static void testUpdateExistingContact() {
        Contact existing = new Contact(LastName='Esistente', Legacy_Id__c='LEGACY-002');
        insert existing;
        Contact payload = new Contact(FirstName='Marco', LastName='Aggiornato', Legacy_Id__c='LEGACY-002', Email='marco@example.com');
        ContactMergeService.MergeReport report = ContactMergeService.mergeContacts(new List<Contact>{payload});
        System.assertEquals(1, report.getProcessedCount());
        System.assertEquals(0, report.getWarningCount());
        System.assert(report.results[0].isSuccess);
        Contact updated = [SELECT FirstName, LastName, Email FROM Contact WHERE Legacy_Id__c='LEGACY-002' LIMIT 1];
        System.assertEquals('Marco', updated.FirstName);
        System.assertEquals('Aggiornato', updated.LastName);
        System.assertEquals('marco@example.com', updated.Email);
    }

    @isTest
    static void testSkipMissingLegacyId() {
        Contact payload = new Contact(LastName='Senza Legacy');
        ContactMergeService.MergeReport report = ContactMergeService.mergeContacts(new List<Contact>{payload});
        System.assertEquals(0, report.getProcessedCount());
        System.assertEquals(1, report.getWarningCount());
        System.assert(report.warnings[0].contains('Legacy_Id__c'));
        System.assertEquals(0, report.results.size());
    }

    @isTest
    static void testPartialSuccessWithMixedRecords() {
        Contact valido = new Contact(LastName='Valido', Legacy_Id__c='LEGACY-004');
        Contact invalido = new Contact(LastName='Non valido');
        ContactMergeService.MergeReport report = ContactMergeService.mergeContacts(new List<Contact>{valido, invalido});
        System.assertEquals(1, report.getProcessedCount());
        System.assertEquals(1, report.getWarningCount());
        System.assert(report.results[0].isSuccess);
        System.assertEquals(1, [SELECT COUNT() FROM Contact WHERE Legacy_Id__c='LEGACY-004']);
    }

    @isTest
    static void testMergeDuplicateLegacyEntries() {
        Contact primo = new Contact(LastName='Originale', Legacy_Id__c='LEGACY-005', Title='Lead Engineer', Phone='111-222-333');
        Contact secondo = new Contact(LastName='Aggiornato', Legacy_Id__c='LEGACY-005', Email='dup@example.com');
        ContactMergeService.MergeReport report = ContactMergeService.mergeContacts(new List<Contact>{primo, secondo});
        System.assertEquals(1, report.getProcessedCount());
        System.assertEquals(0, report.getWarningCount());
        Contact salvato = [SELECT LastName, Title, Email, Phone FROM Contact WHERE Legacy_Id__c='LEGACY-005' LIMIT 1];
        System.assertEquals('Aggiornato', salvato.LastName);
        System.assertEquals('dup@example.com', salvato.Email);
        System.assertEquals('111-222-333', salvato.Phone);
        System.assertEquals('Lead Engineer', salvato.Title);
    }

    @isTest
    static void testBulkUpsertHandlesMultipleRecords() {
        List<Contact> batch = new List<Contact>();
        for (Integer i = 6; i <= 8; i++) {
            batch.add(new Contact(LastName='Bulk' + i, Legacy_Id__c='LEGACY-00' + i, Email='bulk' + i + '@example.com'));
        }
        ContactMergeService.MergeReport report = ContactMergeService.mergeContacts(batch);
        System.assertEquals(3, report.getProcessedCount());
        System.assertEquals(0, report.getWarningCount());
        System.assertEquals(3, [SELECT COUNT() FROM Contact WHERE Legacy_Id__c IN ('LEGACY-006','LEGACY-007','LEGACY-008')]);
    }
}
