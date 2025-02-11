SKIPUNZIP=1

echo "Fix up /product/etc/build.prop"
sed -i "/# Removed by /d" "$WORK_DIR/product/etc/build.prop" \
    && sed -i "s/#bluetooth./bluetooth./g" "$WORK_DIR/product/etc/build.prop" \
    && sed -i "s/?=/=/g" "$WORK_DIR/product/etc/build.prop" \
    && sed -i "$(sed -n "/provisioning.hostname/=" "$WORK_DIR/product/etc/build.prop" | sed "2p;d")d" "$WORK_DIR/product/etc/build.prop"

echo "Disable OEM unlock toggle"
sed -i \
    "$(sed -n "/ro.oem_unlock_supported/=" "$WORK_DIR/vendor/default.prop") cro.oem_unlock_supported=0" \
    "$WORK_DIR/vendor/default.prop"

echo "Disable display refresh rate override"
sed -i \
    "/max_frame_buffer_acquired_buffers/a ro.surface_flinger.enable_frame_rate_override=false" \
    "$WORK_DIR/vendor/default.prop"
