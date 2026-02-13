#!/bin/bash
openclaw models aliases remove gemini-flash
openclaw models aliases remove gemini
openclaw models aliases remove gemini-pro
openclaw models aliases remove gemini-scorta
openclaw models aliases remove codex
openclaw models aliases add gemini-flash google-gemini-cli/gemini-3-flash-preview
openclaw models aliases add gemini-pro google-gemini-cli/gemini-3-pro-preview
openclaw models aliases add gemini-scorta google/gemini-3-flash-preview
openclaw models aliases add codex openai-codex/gpt-5.3-codex
