{
    plugins.avante = {
        enable = true;
        autoLoad = true;
        settings = {
  claude = {
    endpoint = "https://api.anthropic.com";
    max_tokens = 4096;
    model = "claude-3-5-sonnet-20240620";
    temperature = 0;
  };
  dual_boost = {
    enabled = false;
    first_provider = "openai";
    second_provider = "claude";
    prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]";
    timeout = 60000;
  };
  diff = {
    autojump = true;
    debug = false;
    list_opener = "copen";
  };
  highlights = {
    diff = {
      current = "DiffText";
      incoming = "DiffAdd";
    };
  };
  hints = {
    enabled = true;
  };
  mappings = {
    diff = {
      both = "cb";
      next = "]x";
      none = "c0";
      ours = "co";
      prev = "[x";
      theirs = "ct";
    };
  };
  provider = "claude";
  windows = {
    sidebar_header = {
      align = "center";
      rounded = true;
    };
    width = 30;
    wrap = true;
  };
};

    };
}