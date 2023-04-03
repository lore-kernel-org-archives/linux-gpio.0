Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77758C76196
	for <linux-gpio@archiver.kernel.org>; Mon,  3 Apr 2023 07:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbjDCHZP (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 3 Apr 2023 03:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbjDCHZL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Apr 2023 03:25:11 -0400
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D4EB759;
        Mon,  3 Apr 2023 00:25:10 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3337P1IR099914;
        Mon, 3 Apr 2023 02:25:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1680506701;
        bh=6Ed6qPfuT18dvks5JxwLRZtyqU2L3Q9JY+h8JgvLRrk=;
        h=From:To:CC:Subject:Date;
        b=FUTZse4Hmr85JruZEsL1jrKCXfildUFIwKNp0b3dK1KnXXWrjXIcURPl5CPVFhCLD
         sqm4c/OsIWxmtcgbfKu/Bbkzp8EWUFIMKOgd3VlcA4ENyoc1Fyz7Z7zSIkr/3GCpvI
         5X4981AhT/2HRGzU7sZ/SqvnoYVP2vO3Aj/Pu9q4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3337P10g031349
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 3 Apr 2023 02:25:01 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 3
 Apr 2023 02:25:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 3 Apr 2023 02:25:00 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3337Oxje036694;
        Mon, 3 Apr 2023 02:25:00 -0500
From:   Dhruva Gole <d-gole@ti.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Dhruva Gole <d-gole@ti.com>, <linux-kernel@vger.kernel.org>,
        Keerthy <j-keerthy@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Devarsh Thakkar <devarsht@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vibhore Vardhan <vibhore@ti.com>
Subject: [PATCH 0/2] gpio: davinci: interrupt related fixes
Date:   Mon, 3 Apr 2023 12:54:41 +0530
Message-ID: <20230403072443.83810-1-d-gole@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series fixes some critical bugs in the gpio-davinci driver
that come to light when the system tries to wakeup from a suspended
state.

It was earlier posted as an RFC here:
https://lore.kernel.org/all/20230323122910.991148-1-d-gole@ti.com/

No changes, just resending without the RFC tag since the patches are now
proposed to be merged into mainline.
Also add all the Acks and R-by's from respective maintainers and reviewers.

Cc: Keerthy <j-keerthy@ti.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Devarsh Thakkar <devarsht@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Vibhore Vardhan <vibhore@ti.com>

Dhruva Gole (2):
  gpio: davinci: Do not clear the bank intr enable bit in save_context
  gpio: davinci: Add irq chip flag to skip set wake

 drivers/gpio/gpio-davinci.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

-- 
2.25.1

