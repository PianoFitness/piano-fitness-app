shader_type canvas_item;

// These uniform variables let us control the colors from GDScript if needed
uniform vec4 top_color : source_color = vec4(0.95, 0.95, 0.98, 1.0);  // Light blue-gray
uniform vec4 bottom_color : source_color = vec4(0.90, 0.90, 0.95, 1.0);  // Slightly darker blue-gray

void fragment() {
    // UV.y gives us the vertical position (0 at top, 1 at bottom)
    // We use mix() to smoothly blend between the two colors
    vec4 gradient_color = mix(top_color, bottom_color, UV.y);

    // Apply the color to this pixel
    COLOR = gradient_color;
}