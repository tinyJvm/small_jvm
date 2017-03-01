
TMP_OBJ=$(patsubst %.cc,$(BIN_DIR)/%.o,$(SRC))
APP_OBJ=$(patsubst %.S,$(BIN_DIR)/%.o,$(TMP_OBJ))
TESTS=$(patsubst %.cc,$(BIN_DIR)/%.test,$(SRC_TESTS))

.PHONY: clean run tests

all: $(APP)

clean:
	rm -f -r $(BIN_DIR)/*

tests: $(TESTS)
	@javac tests/data/*.java
	$(foreach t, $(TESTS), $(t))

$(APP): $(TINYJVMLIB)
	$(GCC) $(CXXFLAGS) main.cc -o $(APP) $(TINYJVMLIB) -pthread $(LDFLAGS)

$(TINYJVMLIB): $(APP_OBJ)
	@echo "Building $(TINYJVMLIB)"
	@ar rvs $@ $(APP_OBJ)

$(BIN_DIR)/%.o: %.S
	@mkdir -p $(@D)
	$(GCC) -c $(CXXFLAGS) -o $@ $<

$(BIN_DIR)/%.o: %.cc
	@mkdir -p $(@D)
	$(GCC) -c $(CXXFLAGS) -o $@ $<

$(BIN_DIR)/%.test: %.cc $(TINYJVMLIB)
	@mkdir -p $(@D)
	@$(GCC) $(CXXFLAGS) $< -o $@ $(TINYJVMLIB) -pthread -lgtest
