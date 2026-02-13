public with sharing class ContactMergeService {
    public class MergeReport {
        public List<Database.UpsertResult> results = new List<Database.UpsertResult>();
        public List<String> warnings = new List<String>();

        public Integer getProcessedCount() {
            return results.size();
        }

        public Integer getWarningCount() {
            return warnings.size();
        }
    }

    public static MergeReport mergeContacts(List<Contact> incoming) {
        MergeReport report = new MergeReport();
        if (incoming == null || incoming.isEmpty()) {
            return report;
        }

        Map<String, Contact> dedupedByLegacyId = new Map<String, Contact>();
        Integer position = 0;
        for (Contact candidate : incoming) {
            position++;
            if (candidate == null) {
                report.warnings.add('Elemento #' + position + ' era null e non è stato processato.');
                continue;
            }

            String legacyId = candidate.Legacy_Id__c;
            if (String.isBlank(legacyId)) {
                report.warnings.add('Elemento #' + position + ' non aveva Legacy_Id__c e non è stato elaborato.');
                continue;
            }

            Contact toMerge = (Contact)candidate.clone(false, true, false, false);
            if (!dedupedByLegacyId.containsKey(legacyId)) {
                dedupedByLegacyId.put(legacyId, toMerge);
            } else {
                mergeFields(dedupedByLegacyId.get(legacyId), toMerge);
            }
        }

        if (dedupedByLegacyId.isEmpty()) {
            return report;
        }

        report.results = Database.upsert(dedupedByLegacyId.values(), Contact.Legacy_Id__c, false);
        return report;
    }

    private static void mergeFields(Contact target, Contact source) {
        if (target == null || source == null) {
            return;
        }
        for (Schema.SObjectField field : Contact.SObjectType.getDescribe().fields.getMap().values()) {
            Schema.DescribeFieldResult describe = field.getDescribe();
            String fieldName = describe.getName();

            if (!describe.isUpdateable() || fieldName == 'Id' || fieldName == 'Legacy_Id__c') {
                continue;
            }

            Object value = source.get(field);
            if (value != null) {
                target.put(field, value);
            }
        }
    }
}
