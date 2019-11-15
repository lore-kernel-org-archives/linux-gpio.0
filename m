Return-Path: <SRS0=05vI=ZH=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B664C432C3
	for <linux-gpio@archiver.kernel.org>; Fri, 15 Nov 2019 14:45:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FB882073A
	for <linux-gpio@archiver.kernel.org>; Fri, 15 Nov 2019 14:45:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vcvkt6DW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbfKOOpH (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 15 Nov 2019 09:45:07 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46322 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfKOOpG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:45:06 -0500
Received: by mail-pg1-f193.google.com with SMTP id r18so6087413pgu.13
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lJjxkFaNGMI/2BczVuIVgVpycDA94D2fnt8oPouRc0I=;
        b=Vcvkt6DWEvqZerkvfbpwzoJYHzSu4ECcJz37IPAehhxaODX7delYjAMf3Yztr2bflj
         BOi8RATLhV2jmWjjLPhW2LJauUv+2mcxyqb1+ewmqPDFcboLl14stSjDh6umFkr+N7To
         wyPOEbuN03IGRC6oqqys9CsWLy6rx11sAQcBzRTiC5JB6bZLHoXvHoKdORU+e3NgdkT3
         avNkjY8DLD1e0r7FTdQv8vCeFzVtkHUXjD2n3/UGaVY3ogLVtJUakfy1+amedCN2pVaS
         psOIrrxUNim/IjgRdxCtLYP4zQRFMWwKbNlLQRqrqDw8IBWlPHUQfmQUhYMDyxvKVhTv
         tcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lJjxkFaNGMI/2BczVuIVgVpycDA94D2fnt8oPouRc0I=;
        b=Jqw7ieiFxGLR/qMaNubgasyAwezLiIm1QglvsB3pUiV0y0KVjbc5UvraX+jRzzx39g
         Z7YvBle5IVeV3s+WI3r8WNHYyyvs2JOpFIyMu4Ouvfn+1K1AcqxBA+8BAxT2uqbpK2Ue
         2FDeYX7DMjWm6NdaI+z+grDo+bfK8AlgnZJ/bDgcOt6TlFUg1nO4QpP/WYfJri3fS6LI
         eQd2VWZefZKse0AIgFGYuePng/Je84Es+A5KVhmB1b94Gsttr810Abaq+tGF+bPuW8ZR
         cfS+eqlA0nWgDDrglOk6+sxvHNRhuRMocy35qOwbN2VS2naygjG7L1Hpbb/6yTc+H3CM
         u8wA==
X-Gm-Message-State: APjAAAXl5PBzsK1XtKP8ESV6GKH2j1sZ2GbmzDXvVNj+V8hcb1VGKZzk
        Q+3hzCZyKmCLlhmvntE9UvelNJmjlD8=
X-Google-Smtp-Source: APXvYqyzjY+bOvkG/o5eU+t1mq8DdpBjMxq3nQNnSDXr59OXII10VkJOPDL0EWsJAqr/jfk6IysTrQ==
X-Received: by 2002:a63:f848:: with SMTP id v8mr16425664pgj.285.1573829105354;
        Fri, 15 Nov 2019 06:45:05 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:45:04 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 08/19] bindings: cxx: tests: add tests for bias flags
Date:   Fri, 15 Nov 2019 22:43:44 +0800
Message-Id: <20191115144355.975-9-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend test coverage over the bias flags in requests and the bias setting
returned by line.bias().

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/cxx/tests/tests-line.cpp | 87 +++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index 3ba2fc2..ef314b9 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -52,6 +52,9 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.consumer().empty());
 		REQUIRE_FALSE(line.is_requested());
 		REQUIRE_FALSE(line.is_used());
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_AS_IS);
 	}
 
 	SECTION("exported line")
@@ -68,6 +71,9 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_AS_IS);
 	}
 
 	SECTION("exported line with flags")
@@ -88,6 +94,87 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.is_used());
 		REQUIRE(line.is_open_drain());
 		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_AS_IS);
+	}
+
+	SECTION("exported open source line")
+	{
+		::gpiod::line_request config;
+
+		config.consumer = consumer.c_str();
+		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
+		config.flags = ::gpiod::line_request::FLAG_OPEN_SOURCE;
+		line.request(config);
+
+		REQUIRE(line.offset() == 4);
+		REQUIRE(line.name() == "gpio-mockup-A-4");
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE(line.is_requested());
+		REQUIRE(line.is_used());
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE(line.is_open_source());
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_AS_IS);
+	}
+
+	SECTION("exported bias disable line")
+	{
+		::gpiod::line_request config;
+
+		config.consumer = consumer.c_str();
+		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
+		config.flags = ::gpiod::line_request::FLAG_BIAS_DISABLE;
+		line.request(config);
+
+		REQUIRE(line.offset() == 4);
+		REQUIRE(line.name() == "gpio-mockup-A-4");
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE(line.is_requested());
+		REQUIRE(line.is_used());
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_DISABLE);
+	}
+
+	SECTION("exported pull-down line")
+	{
+		::gpiod::line_request config;
+
+		config.consumer = consumer.c_str();
+		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
+		config.flags = ::gpiod::line_request::FLAG_BIAS_PULL_DOWN;
+		line.request(config);
+
+		REQUIRE(line.offset() == 4);
+		REQUIRE(line.name() == "gpio-mockup-A-4");
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE(line.is_requested());
+		REQUIRE(line.is_used());
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_PULL_DOWN);
+	}
+
+	SECTION("exported pull-up line")
+	{
+		::gpiod::line_request config;
+
+		config.consumer = consumer.c_str();
+		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
+		config.flags = ::gpiod::line_request::FLAG_BIAS_PULL_UP;
+		line.request(config);
+
+		REQUIRE(line.offset() == 4);
+		REQUIRE(line.name() == "gpio-mockup-A-4");
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE(line.is_requested());
+		REQUIRE(line.is_used());
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_PULL_UP);
 	}
 
 	SECTION("update line info")
-- 
2.24.0

