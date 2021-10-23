package wavm

/*
#include "wavm-c.h"

void wasm_config_enable_all(wasm_config_t* c) {
	wasm_config_feature_set_import_export_mutable_globals(c, true);
	wasm_config_feature_set_nontrapping_float_to_int(c, true);
	wasm_config_feature_set_sign_extension(c, true);
	wasm_config_feature_set_bulk_memory_ops(c, true);
	wasm_config_feature_set_simd(c, true);
	wasm_config_feature_set_atomics(c, true);
	wasm_config_feature_set_exception_handling(c, true);
	wasm_config_feature_set_multivalue(c, true);
	wasm_config_feature_set_reference_types(c, true);
	wasm_config_feature_set_extended_name_section(c, true);
	wasm_config_feature_set_multimemory(c, true);
	wasm_config_feature_set_shared_tables(c, true);
}

wasm_config_t* wasm_config_new_enable_all() {
	wasm_config_t* c = wasm_config_new();
	wasm_config_enable_all(c);
	return c;
}

*/
import "C"

type Config C.wasm_config_t

func NewConfig() *Config {
	return (*Config)(C.wasm_config_new())
}

func NewConfigAll() *Config {
	return (*Config)(C.wasm_config_new_enable_all())
}

func (c *Config) Close() error {
	c.Delete()
	return nil
}

func (c *Config) Delete() {
	C.wasm_config_delete((*C.wasm_config_t)(c))
}

func (c *Config) EnableAll() *Config {
	C.wasm_config_enable_all((*C.wasm_config_t)(c))
	return c
}

func (c *Config) SetImportExportMutableGlobals(enable bool) *Config {
	C.wasm_config_feature_set_import_export_mutable_globals((*C.wasm_config_t)(c), (C.bool)(enable))
	return c
}

func (c *Config) SetNonTrappingFloatToInt(enable bool) *Config {
	C.wasm_config_feature_set_nontrapping_float_to_int((*C.wasm_config_t)(c), (C.bool)(enable))
	return c
}

func (c *Config) SetSignExtension(enable bool) *Config {
	C.wasm_config_feature_set_sign_extension((*C.wasm_config_t)(c), (C.bool)(enable))
	return c
}

func (c *Config) SetBulkMemoryOps(enable bool) *Config {
	C.wasm_config_feature_set_bulk_memory_ops((*C.wasm_config_t)(c), (C.bool)(enable))
	return c
}

func (c *Config) SetSIMD(enable bool) *Config {
	C.wasm_config_feature_set_simd((*C.wasm_config_t)(c), (C.bool)(enable))
	return c
}

func (c *Config) SetAtomics(enable bool) *Config {
	C.wasm_config_feature_set_atomics((*C.wasm_config_t)(c), (C.bool)(enable))
	return c
}

func (c *Config) SetExceptionHandling(enable bool) *Config {
	C.wasm_config_feature_set_exception_handling((*C.wasm_config_t)(c), (C.bool)(enable))
	return c
}

func (c *Config) SetMultiValue(enable bool) *Config {
	C.wasm_config_feature_set_multivalue((*C.wasm_config_t)(c), (C.bool)(enable))
	return c
}

func (c *Config) SetReferenceTypes(enable bool) *Config {
	C.wasm_config_feature_set_reference_types((*C.wasm_config_t)(c), (C.bool)(enable))
	return c
}

func (c *Config) SetExtendedNameSection(enable bool) *Config {
	C.wasm_config_feature_set_extended_name_section((*C.wasm_config_t)(c), (C.bool)(enable))
	return c
}

func (c *Config) SetMultiMemory(enable bool) *Config {
	C.wasm_config_feature_set_multimemory((*C.wasm_config_t)(c), (C.bool)(enable))
	return c
}
