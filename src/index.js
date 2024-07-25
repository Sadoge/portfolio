import React from 'react';
import { createRoot } from 'react-dom/client';
import { ChakraProvider } from '@chakra-ui/react';
import App from './App';
import theme from './theme';

// Find the root element in your HTML
const rootElement = document.getElementById('root');

// Create a root
const root = createRoot(rootElement);

// Render the App component inside the ChakraProvider with the custom theme
root.render(
  <ChakraProvider theme={theme}>
    <App />
  </ChakraProvider>
);
