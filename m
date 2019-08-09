Return-Path: <SRS0=5jam=WF=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE45C32756
	for <linux-gpio@archiver.kernel.org>; Fri,  9 Aug 2019 08:30:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AB6A2166E
	for <linux-gpio@archiver.kernel.org>; Fri,  9 Aug 2019 08:30:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wj8n0jj7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405395AbfHIIaj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 9 Aug 2019 04:30:39 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48544 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405818AbfHIIaj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 04:30:39 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x798UZ1I117633;
        Fri, 9 Aug 2019 03:30:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565339435;
        bh=4Xbkn6elvsTb+7O7XxccoWaDLZ3csgRAgOrOdCJJ2o4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=wj8n0jj7s9RmTUkgCNZBrx/at6fTh7B+zpI6WmrpGqYTEsf6SqD/tfiJzbk2WDLND
         vHWsyo/uSonk7NmQTQqRKZUB4CXGmTjjIskkzYeOb5ElXoN7V3rqsE9aXrRz306mKN
         8/EB5DxudO10hVEIM5wQMt1HbYDgo7NKLbHNfUTE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x798UZ88117311
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 9 Aug 2019 03:30:35 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 9 Aug
 2019 03:30:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 9 Aug 2019 03:30:34 -0500
Received: from uda0131933.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x798USdf070370;
        Fri, 9 Aug 2019 03:30:32 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        <linus.walleij@linaro.org>
CC:     Keerthy <j-keerthy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        <linux-gpio@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 1/6] dt-bindings: gpio: davinci: Add new compatible for J721E SoCs
Date:   Fri, 9 Aug 2019 13:59:42 +0530
Message-ID: <20190809082947.30590-2-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809082947.30590-1-lokeshvutla@ti.com>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

J721e SoCs have same gpio IP as K2G davinci gpio. Add a new compatible to
handle J721E SoCs.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 Documentation/devicetree/bindings/gpio/gpio-davinci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
index bc6b4b62df83..cd91d61eac31 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
@@ -6,6 +6,7 @@ Required Properties:
 						66AK2E SoCs
 			"ti,k2g-gpio", "ti,keystone-gpio": for 66AK2G
 			"ti,am654-gpio", "ti,keystone-gpio": for TI K3 AM654
+			"ti,j721e-gpio", "ti,keystone-gpio": for J721E SoCs
 
 - reg: Physical base address of the controller and the size of memory mapped
        registers.
-- 
2.22.0

