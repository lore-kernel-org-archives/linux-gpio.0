Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E4DC77B7E
	for <linux-gpio@archiver.kernel.org>; Fri, 26 May 2023 02:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbjEZC6m (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 25 May 2023 22:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjEZC6l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2023 22:58:41 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 618709C;
        Thu, 25 May 2023 19:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=BtQtD
        QDNBc1rLN9VOsByZob5obbadHZQLbYhv5fqn90=; b=LQ5+5ltqbXpXc+gewuRff
        8f1UqjmUtTXh0Jwfp8ZfmQzz2K47Fe3ztSEL/leHE5uCoZ8vUDTL2jJfSftGe4KB
        x9JGffGRaAEYQp4QPE4RMBmhAtTyLLjmGXn/s3yaGlnBhafowYtOrXxZu18hk6Ha
        eWHDKID8AA1ThKzzGNcPu4=
Received: from localhost.localdomain (unknown [39.144.137.221])
        by zwqz-smtp-mta-g0-4 (Coremail) with SMTP id _____wCnVm4ZIHBkyhCDAg--.50904S2;
        Fri, 26 May 2023 10:57:30 +0800 (CST)
From:   xingtong_wu@163.com
To:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     xingtong.wu@siemens.com, henning.schild@siemens.com
Subject: [PATCH 0/1] gpio-f7188x: fix base values conflicts with other gpio pins
Date:   Tue, 30 Dec 2042 21:08:10 +0800
Message-Id: <20421230130811.2542-1-xingtong_wu@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnVm4ZIHBkyhCDAg--.50904S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUBjNtDUUUU
X-Originating-IP: [39.144.137.221]
X-CM-SenderInfo: p0lqw35rqjs4rx6rljoofrz/1tbiOwB70GC5lsNDawAAs0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Switch pin base from static to automatic allocation to avoid
conflicts and align with other gpio chip drivers

Based on:
 [PATCH v2 1/1] gpio-f7188x: fix chip name and pin count on Nuvoton chip
 which was recently pulled by maintainer


