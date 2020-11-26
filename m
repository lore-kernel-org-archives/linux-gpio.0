Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7288FC56202
	for <linux-gpio@archiver.kernel.org>; Thu, 26 Nov 2020 01:47:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08B202168B
	for <linux-gpio@archiver.kernel.org>; Thu, 26 Nov 2020 01:47:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=permerror (0-bit key) header.d=wdc.com header.i=@wdc.com header.b="gWRTqj5e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731670AbgKZBrZ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 25 Nov 2020 20:47:25 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:25409 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731621AbgKZBrZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Nov 2020 20:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606356392; x=1637892392;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DLGlYRkG0jnb7Ld5Lv0oGqxXJnOL+HsDeHSz7diUnGM=;
  b=gWRTqj5eXYsm96VbHDu75tqTqOxNBJoKDu+n6ey6UNPQVkdsxpBkAMkr
   NtsaqhR/5Li3FFAzQHGmyyguo5qFoA2yVj0348JLotTcyK7Js/bjbcC94
   jhvIdAGtSpB7NxL2LuEMxPD7CtbHuSiiBNOpLET7E2tdN8mcDwxlv91ER
   8f6CZ8ZRs4cfSuMHz3Zjd4eUI+cR9dLf2wHl2RgwsAXnbSEjV3JkThnMA
   +fS2ZqOSkNuzl0DCTCWnMSLPkcOnmBA8IaoahJd9X6I4r7uiFZcXG5Ooc
   vyoj2DXBOlUzq+ZWTXk2SB5W4ND6qJA6FAty27KZ7tMqTNLs3xhTKacOY
   w==;
IronPort-SDR: mtQKRCI8Y9D6N2B4Lu+9NH8Bs60qbGLSK0hdjJLLWsGrO0W7QpKme4vyNlVrcMSFvHJVOOeSn1
 4R87UY8o+Z6K1HdIQpwN/7Ofaa8SMHV0HGOPbWOuTP2pcTZwiz5xEtn0sMM1tNDAjWu2PbcpRg
 ZZyobHLj2rwD2rgnpNjS5JMfd67l8WkCbfuflsWoLy4p/6e++fPlLSX4GOSMdy6IQeTvabD6vh
 6+0UnoAqYkoheZ7MPmHw6JiOqfWK7qhvoyX/GgNPGUA+ihoa76AfDSa8/K4yipwyLqedffLWLQ
 axk=
X-IronPort-AV: E=Sophos;i="5.78,370,1599494400"; 
   d="scan'208";a="257148714"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 26 Nov 2020 10:06:31 +0800
IronPort-SDR: WKgOhH/VZRO91aCXc4YYZp/E5D/cdTPW8VzB4akvKpljZXdFFIVp+9aBFsptvZAot4gP+Xhlva
 FRORNF5l4rKE2yFRZXdVMN+1uBfQUqKlg=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 17:33:06 -0800
IronPort-SDR: gdUSKvmgWGdKcd58p8gXhnwudIOyefHZ4K3j/HMoAONHHdBAvMPhJcUZ+RmM7kZm8wmXF/uU1h
 A4OrFNosJaKw==
WDCIronportException: Internal
Received: from 57m2vf2.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.135])
  by uls-op-cesaip02.wdc.com with ESMTP; 25 Nov 2020 17:47:22 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Serge Semin <fancer.lancer@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 0/1] Fix dwapb gpio snps,nr-gpios property handling
Date:   Thu, 26 Nov 2020 10:47:15 +0900
Message-Id: <20201126014716.34545-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A single patch to fix handling of the "snps,nr-gpios" property of the
Synopsis DW apb gpio controller. Parsing of this deprecated property
triggers a device tree parsing error in of_link_to_suppliers().

This patch is extracted from the series "RISC-V Kendryte K210
support improvements".

Changes from v2:
* Move the warning about the use of the deprecated property name from
  the dwapb gpio driver initialization into the OF property parsing
  code as suggested by Serge. This removes the second patch that was
  in v2 of the series.

Changes from v1:
* Extracted the patches from the series "RISC-V Kendryte K210 support
  improvements".
* Added a warning about the use of the deprecated property name in the
  dwapb gpio driver initialization

Damien Le Moal (1):
  of: Fix gpios supplier parsing

 drivers/of/property.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

-- 
2.28.0

