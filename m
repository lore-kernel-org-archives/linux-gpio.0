Return-Path: <SRS0=tTco=XG=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BEFC49ED7
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Sep 2019 02:11:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8058F206A1
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Sep 2019 02:11:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="zifx//jf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfIKCLK (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 10 Sep 2019 22:11:10 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]:35084 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfIKCLK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2019 22:11:10 -0400
Received: by mail-wm1-f54.google.com with SMTP id n10so1564074wmj.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2019 19:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TD28iBWwRa7Ac52I/zghzn6EQhI0jeu+sqFsZRS3sTg=;
        b=zifx//jfJts/LffiM0Cwi399ahGbAvSHg/Qw0TFrIRPRM68c8MTP97HqlayKfq7H3W
         amiqeCYVPYMLwvK9VsvzyZrjx9kgQXizo6ejOYHmP8wP+6bsFB8L1OCWbkEfsTZvp+2T
         zsU18DLH7bZ45pn4Ubs3HtCiMVPVWOa1ttSXouoilQ6Xx7yBPohu0jfZJJT1tC0iJsNY
         /+D7WfBVSh1+7pGhJtV2Ps5s9fFeqB+8584CXsWrpmJlMCoQORt5FW/QvgEusK/wvwo3
         tMCQvmV0+i924hu+O4kZcrVvKuo9BC4FoSK1VWGy4qxMAFIzLWG/qeKdEj4RwGuadS9b
         fq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TD28iBWwRa7Ac52I/zghzn6EQhI0jeu+sqFsZRS3sTg=;
        b=imtJ8Wtb/hBQonvH3tQdSj4GghGIyJnEELV/jgVW2+IP/C1bre9XbsIndJX/ETlwEO
         RPV0hGYmb6EY34E3RXSgzLiPST1yLLt1gO+w4Bnwl/2nmBMTpkcOpbn4UTgt3VFBjSd6
         VgsbJc/2FHO5s8lJvDAvIVCyaFUj35AFKBZzdYBeerRQAJ6Cx3a83CQunErx3gplAhvB
         XNtcB/pQp4Qz4NLrDaaspEwE62PryU3ZaKDvUHShlZ3e5t2+9uOicptOq3r1ZAQsDH9D
         Ow+twiFDg9c5xVCYbyj+Nu3zY2K0rhiikivEV79D+7gbxcDkmXNIgymZCYPHPmgwByiL
         8fKg==
X-Gm-Message-State: APjAAAV9NfpuNW+cohKAUVF6G3oP7ARnJmxtjeMGcdihU2NSuomMw+rt
        xQ2G4Epv9Dm+IMedgWR8TDhWngkA03dUCA==
X-Google-Smtp-Source: APXvYqxHRvg6PnyBW/TnFD/I0TMelTJ3DYQPKxD8BtAQZK9XaDmaiEFRzi6QZUboI30hEqvAfvcNXQ==
X-Received: by 2002:a1c:7f4f:: with SMTP id a76mr1795849wmd.117.1568167867830;
        Tue, 10 Sep 2019 19:11:07 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u22sm37448568wru.72.2019.09.10.19.11.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Sep 2019 19:11:07 -0700 (PDT)
Message-ID: <5d7857bb.1c69fb81.dcfef.3a61@mx.google.com>
Date:   Tue, 10 Sep 2019 19:11:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc8-78-ga818894f80cc
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 48 boots: 0 failed,
 48 passed (v5.3-rc8-78-ga818894f80cc)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 48 boots: 0 failed, 48 passed (v5.3-rc8-78-ga818894f8=
0cc)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.3-rc8-78-ga818894f80cc/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc8-78-ga818894f80cc/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc8-78-ga818894f80cc
Git Commit: a818894f80cc1327e2f20c07291701ccf31584ec
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 42 unique boards, 14 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
