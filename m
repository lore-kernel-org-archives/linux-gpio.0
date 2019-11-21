Return-Path: <SRS0=VJIG=ZN=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE48C432C0
	for <linux-gpio@archiver.kernel.org>; Thu, 21 Nov 2019 00:36:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3AF2D20715
	for <linux-gpio@archiver.kernel.org>; Thu, 21 Nov 2019 00:36:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUYGGEYZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbfKUAg3 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 20 Nov 2019 19:36:29 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36111 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfKUAg3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 19:36:29 -0500
Received: by mail-pf1-f194.google.com with SMTP id b19so690697pfd.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 16:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1QMIzQdivMNr/urrFibb1d3I1FoG0wJ7ERlY8y923yU=;
        b=hUYGGEYZlYp1TzZioBErw74Toqmh9G+chNd+2cZPBpuaSCd0/8cJP9olbPNhbl766C
         3aw63c+ohGZq8sbzONCUz+9fkho0q8f9zKvFTHRezEZetvEGESELAX+snl+gOTHW1BJS
         Y40Zdjj1RxItSGlou4NmrgA6dSaMa+UEHePz1RO39ICnAPmopXxfyZnARNPoknZG21H2
         mq9xeyxrVxHnDKZDME99o/ijZzSpF19SBbPSMEr5EIo5YkRcWZok6GdiHQtHNmaN/d0V
         fKAbI2P9bLDx/p0yOxepiM+Efvri85/M2tx6iB3D2TSlX6/6+wEEpeypfEEYAvZUPcZG
         xyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1QMIzQdivMNr/urrFibb1d3I1FoG0wJ7ERlY8y923yU=;
        b=EPUED2LYw1jx2QSqFVC8LKJJWBC1KMuqo6rAxe8cKCBMX9K2tCcwp9+z1+NzClFtsM
         FPNXY0nHQBDt3oBysnc522HeB9aXPMaizdV1REi6brTZicodjjubmuuu7uggzaDBQRnQ
         q5H0TcQ85XkwFAVKV2J8p7QudyyhCrM4VaJugUaZRPlNJXmjVCIfdmYFeQD+JphaWkKK
         GtH59L3qBMmK8J+VxxBtSW5MQVLG9Hyf7rGWco6fuiwHiz54F5XyNScZjD0jGDMOadrG
         7wXK6GSdcjQFPwd0uoicQgpcGF3ny9svCJ25i/m+hDssB9rFpJhs0mVk/CtbpVByBxyL
         FOMQ==
X-Gm-Message-State: APjAAAXPoYTcDbD2R0vvd7sjdV1D8PLhtiTNwZm1NZu5prpi44lT+X2E
        yniG1Uvf73LTzG3nhp/6NWDdhz0SVLo=
X-Google-Smtp-Source: APXvYqzWjwXq/ODzOslAzdApUwNgBS31rFnlg1RDdgWmEg4PXZ8Y7qDjZt/rDtTL0lXu+ogJeZ9+Jw==
X-Received: by 2002:a63:5c42:: with SMTP id n2mr6126195pgm.229.1574296587780;
        Wed, 20 Nov 2019 16:36:27 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id s1sm420756pgk.9.2019.11.20.16.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:36:27 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH v2 04/14] bindings: cxx: tests: add tests for bias flags
Date:   Thu, 21 Nov 2019 08:35:46 +0800
Message-Id: <20191121003556.9020-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121003556.9020-1-warthog618@gmail.com>
References: <20191121003556.9020-1-warthog618@gmail.com>
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
index fedaa05..9a0b488 100644
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

