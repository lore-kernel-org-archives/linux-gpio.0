Return-Path: <SRS0=VJIG=ZN=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F5AC432C0
	for <linux-gpio@archiver.kernel.org>; Thu, 21 Nov 2019 00:36:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD83120855
	for <linux-gpio@archiver.kernel.org>; Thu, 21 Nov 2019 00:36:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJUuH1UC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbfKUAge (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 20 Nov 2019 19:36:34 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:46068 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfKUAge (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 19:36:34 -0500
Received: by mail-pj1-f65.google.com with SMTP id m71so600405pjb.12
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 16:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S/HBD8d8BDWiXdFnRjwHb/de2FlPpTYAQz1J8zQ/lgw=;
        b=RJUuH1UCh9uk8oeKJsa+1MIEVaFa35x2VyL6Zoh0At3FP+kUFAREwGQdwTP4oX6AJh
         XJB26BIOGS7ClMGH/UP+CvjzXk1E9ljp9yuMs7iJ5oZArx0VzU1HVLSkfxUJLd3BlwQI
         eUGOWw8qGWZHExFiYGYczKgEK2r+dkOZlG0SreQ7TNj/av7h1mRMFH/tOs/a11QlWEvh
         rAqdnaITpvXUxVfDhp5zF4Lg4PWcYH941w18kUH9NZqSNvOqQ/GiGMHiik737j04XCYw
         ir0tTCAk+F5bjTAHuiLIJRWN6cs54QUog4/4MXTDS3hsLMLZViiUy+A6jxJdPx6cqSLM
         o4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S/HBD8d8BDWiXdFnRjwHb/de2FlPpTYAQz1J8zQ/lgw=;
        b=cC31QCyIIUx0ybBIweF/6ug63eQGyZbVtpb21JodI0MCykAFOam8XweaupngyXFjEG
         sIFiC4kb+MLI+BxHk/yZtcihNGNeJ82WZk4ZCbF8+BmjRcS5eviP2DLDL7Pttdq21iiO
         Nl1exWbkwhMuB/xazljfaXMIKwRMNxNVuala6hY0LZmNxYp88F2nZgrJoWKFg4u/Puxv
         ePYQWr6Fjr2l8Xmx3ndpNkFVwd7q6ZfE9WwHmSvbBqdtmaVESSVAvTaJeklPpaqtB7bw
         7Xwtxb1/PV1nG0hA4DXDvOHVEtsQyPIJzKT71SVyhtZ9Mi8cdgNsoZ/qD9u2BgC1SaJd
         116Q==
X-Gm-Message-State: APjAAAWR90845/LYtJofwElKSRibAJm1qThQamBBIcHRTg/h7bXLXJ/H
        pxLi9NRI5/oOKHRRnISy4Q+9x2HJWRQ=
X-Google-Smtp-Source: APXvYqw/4lz5iNaKDhWeZvW8/Fb350WtjW8zyjIp1ukcyt0EOABMkxun+2ciH36N6+uRdprlvSaamQ==
X-Received: by 2002:a17:902:6b85:: with SMTP id p5mr5789874plk.32.1574296592842;
        Wed, 20 Nov 2019 16:36:32 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id s1sm420756pgk.9.2019.11.20.16.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:36:32 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH v2 06/14] bindings: python: tests: add tests for bias flags
Date:   Thu, 21 Nov 2019 08:35:48 +0800
Message-Id: <20191121003556.9020-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121003556.9020-1-warthog618@gmail.com>
References: <20191121003556.9020-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend test coverage to cover the bias flags in requests and the bias
setting returned by line.bias().

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/tests/gpiod_py_test.py | 91 ++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index ed31c8e..9330b43 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -306,6 +306,97 @@ class LineInfo(MockupTestCase):
             self.assertTrue(line.is_requested())
             self.assertTrue(line.is_open_drain())
             self.assertFalse(line.is_open_source())
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_AS_IS)
+
+    def test_exported_open_drain_line(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(4)
+            flags = gpiod.LINE_REQ_FLAG_OPEN_DRAIN
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_DIR_OUT,
+                         flags=flags)
+            self.assertEqual(line.offset(), 4)
+            self.assertEqual(line.name(), 'gpio-mockup-A-4')
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_HIGH)
+            self.assertEqual(line.consumer(), default_consumer)
+            self.assertTrue(line.is_used())
+            self.assertTrue(line.is_requested())
+            self.assertTrue(line.is_open_drain())
+            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_AS_IS)
+
+    def test_exported_open_source_line(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(4)
+            flags = gpiod.LINE_REQ_FLAG_OPEN_SOURCE
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_DIR_OUT,
+                         flags=flags)
+            self.assertEqual(line.offset(), 4)
+            self.assertEqual(line.name(), 'gpio-mockup-A-4')
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_HIGH)
+            self.assertEqual(line.consumer(), default_consumer)
+            self.assertTrue(line.is_used())
+            self.assertTrue(line.is_requested())
+            self.assertFalse(line.is_open_drain())
+            self.assertTrue(line.is_open_source())
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_AS_IS)
+
+    def test_exported_bias_disable_line(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(4)
+            flags = gpiod.LINE_REQ_FLAG_BIAS_DISABLE
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_DIR_OUT,
+                         flags=flags)
+            self.assertEqual(line.offset(), 4)
+            self.assertEqual(line.name(), 'gpio-mockup-A-4')
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_HIGH)
+            self.assertEqual(line.consumer(), default_consumer)
+            self.assertTrue(line.is_used())
+            self.assertTrue(line.is_requested())
+            self.assertFalse(line.is_open_drain())
+            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_DISABLE)
+
+    def test_exported_bias_pull_down_line(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(4)
+            flags = gpiod.LINE_REQ_FLAG_BIAS_PULL_DOWN
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_DIR_OUT,
+                         flags=flags)
+            self.assertEqual(line.offset(), 4)
+            self.assertEqual(line.name(), 'gpio-mockup-A-4')
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_HIGH)
+            self.assertEqual(line.consumer(), default_consumer)
+            self.assertTrue(line.is_used())
+            self.assertTrue(line.is_requested())
+            self.assertFalse(line.is_open_drain())
+            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_PULL_DOWN)
+
+    def test_exported_bias_pull_up_line(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(4)
+            flags = gpiod.LINE_REQ_FLAG_BIAS_PULL_UP
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_DIR_OUT,
+                         flags=flags)
+            self.assertEqual(line.offset(), 4)
+            self.assertEqual(line.name(), 'gpio-mockup-A-4')
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_HIGH)
+            self.assertEqual(line.consumer(), default_consumer)
+            self.assertTrue(line.is_used())
+            self.assertTrue(line.is_requested())
+            self.assertFalse(line.is_open_drain())
+            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_PULL_UP)
 
     def test_update_line_info(self):
         with gpiod.Chip(mockup.chip_name(0)) as chip:
-- 
2.24.0

