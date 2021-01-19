lista <- organize_tfd(x)
teste <- lista[[1]][1]

p_data_nasc <- "Data\\s{1,2}Nasc\\.\\:\\s{1,2}(\\d{2}/\\d{2}/\\d{4})"
p_nome <- "Nome\\:\\s{1,2}(.+)?\r\n"
p_filiacao <- "Filia\u00e7\u00e3o\\:\\s+([\\w\\s]+)?\r\n\\s+([\\w\\s]+)\r\n"
p_cor <- "Cor\\:\\s+(\\w+)"
p_profissao <- "Profiss\u00e3o\\:\\s*(.+)?\r\n"
p_escolaridade <- "Instru\u00e7\u00e3o\\:\\s*(.+)?\\Estado"
p_estado_civil <- "Estado\\s{1,2}Civil\\:\\s*(.+)\r\n"
p_naturalidade <- "Naturalidade\\:\\s*(.+)?Nacionalidade"
p_nacionalidade <- "Nacionalidade\\:\\s*(.+)?\r\n"
p_vulgos <- "Vulgos\\:\\s*(.+)?\r\n"
