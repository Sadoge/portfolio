import { extendTheme } from "@chakra-ui/react";

const theme = extendTheme({
  styles: {
    global: (props) => ({
      body: {
        bg: props.colorMode === 'dark' ? '#1A202C' : '#f5f5f5',
        color: props.colorMode === 'dark' ? '#f5f5f5' : '#333333',
      },
    }),
  },
  fonts: {
    heading: "Inter, sans-serif",
    body: "Inter, sans-serif",
  },
  colors: {
    brand: {
      50: "#f0e7db",
      100: "#e2d2c0",
      200: "#d4bca6",
      300: "#c6a68b",
      400: "#b89071",
      500: "#a97a56",
      600: "#8b6344",
      700: "#6e4c33",
      800: "#503522",
      900: "#321e11",
    },
    light: {
      background: '#f5f5f5',
      text: '#333333',
      card: 'white'
    },
    dark: {
      background: '#1A202C',
      text: '#f5f5f5',
      card: '#2D3748'
    }
  },
  components: {
    Button: {
      baseStyle: {
        borderRadius: "md",
        _focus: {
          boxShadow: "none",
        },
      },
      variants: {
        solid: (props) => ({
          bg: props.colorMode === "dark" ? "brand.500" : "brand.400",
          color: "white",
          _hover: {
            bg: props.colorMode === "dark" ? "brand.600" : "brand.500",
          },
        }),
      },
    },
  },
});

export default theme;