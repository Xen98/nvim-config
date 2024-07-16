vim.api.nvim_create_user_command('UploadFtp', function(opts)
  local full_path = vim.fn.expand('%:p')             -- Ruta completa del archivo actual
  local base_dir = "/home/luis/psicosmart/evaltric/" -- Directorio base del proyecto

  -- Obtiene la ruta relativa desde el directorio base
  local relative_path = full_path:gsub(base_dir, '')

  -- Formatea el comando para ejecutar el script de shell
  local cmd = string.format('sh /home/luis/scripts/upload_ftp.sh %s', relative_path)

  -- Imprime el comando en la consola de Neovim
  -- print("Comando a ejecutar: " .. cmd)

  -- Captura la salida estándar y de error del comando
  local handle = io.popen(cmd .. " 2>&1")
  local result = handle:read('*a') -- Lee toda la salida del comando
  local success = handle:close()   -- Captura el estado de cierre del comando

  print("Resultado del comando: " .. (result or "nil"))

  -- local success = 1

  -- Verifica el éxito de la ejecución
  if not success then
    -- Muestra un mensaje de error si la ejecución falló
    vim.notify("Error al subir el archivo al FTP: " .. result, vim.log.levels.ERROR)
  else
    -- Verifica el contenido de la salida para determinar el éxito
    if result:match("Éxito: Archivo subido al FTP correctamente.") then
      vim.notify("Archivo subido al FTP exitosamente.", vim.log.levels.INFO)
    else
      vim.notify("Error al subir el archivo al FTP: " .. result, vim.log.levels.ERROR)
    end
  end
end, { nargs = 0 })
