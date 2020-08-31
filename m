Return-Path: <SRS0=d2O3=CJ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8280AC2BBD0
	for <linux-gpio@archiver.kernel.org>; Mon, 31 Aug 2020 08:11:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E92821527
	for <linux-gpio@archiver.kernel.org>; Mon, 31 Aug 2020 08:11:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgHaILY (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 31 Aug 2020 04:11:24 -0400
Received: from mo-csw1514.securemx.jp ([210.130.202.153]:45894 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728035AbgHaILW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 04:11:22 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 07V8AqTW026219; Mon, 31 Aug 2020 17:10:52 +0900
X-Iguazu-Qid: 34tKBCMUDYhpk0wN40
X-Iguazu-QSIG: v=2; s=0; t=1598861451; q=34tKBCMUDYhpk0wN40; m=fwVSzkDYvj5OI+0lwI0eUKMLoS7HY8P+wJzn7TIPcZA=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1511) id 07V8Aoai037753;
        Mon, 31 Aug 2020 17:10:51 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 07V8AoAF028308;
        Mon, 31 Aug 2020 17:10:50 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 07V8Aoma004565;
        Mon, 31 Aug 2020 17:10:50 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v3 8/8] arm64: defconfig: Enable configs for Toshiba Visconti
Date:   Mon, 31 Aug 2020 17:10:25 +0900
X-TSB-HOP: ON
Message-Id: <20200831081025.2721320-9-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enable support for the Toshiba Visconti SoCs.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e0f33826819f..8faadd68f859 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -57,6 +57,7 @@ CONFIG_ARCH_THUNDER=y
 CONFIG_ARCH_THUNDER2=y
 CONFIG_ARCH_UNIPHIER=y
 CONFIG_ARCH_VEXPRESS=y
+CONFIG_ARCH_VISCONTI=y
 CONFIG_ARCH_XGENE=y
 CONFIG_ARCH_ZX=y
 CONFIG_ARCH_ZYNQMP=y
-- 
2.27.0

