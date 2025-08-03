local user_input = vim.fn.input 'Enter your text: '
vim.g.my_user_variable = user_input
print('You entered: ' .. vim.g.my_user_variable)
