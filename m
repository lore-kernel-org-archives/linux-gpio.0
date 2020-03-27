Return-Path: <SRS0=HDci=5M=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7BFC43331
	for <linux-gpio@archiver.kernel.org>; Fri, 27 Mar 2020 11:29:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F1C9D20578
	for <linux-gpio@archiver.kernel.org>; Fri, 27 Mar 2020 11:29:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="grfUG4AD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbgC0L3h (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 27 Mar 2020 07:29:37 -0400
Received: from mail-pj1-f44.google.com ([209.85.216.44]:33327 "EHLO
        mail-pj1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgC0L3h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 07:29:37 -0400
Received: by mail-pj1-f44.google.com with SMTP id jz1so4289649pjb.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 04:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ygp4m3e21yduhfv+GJMy4zBm6kfVmnItJHaRjESclks=;
        b=grfUG4AD6Hla315nukuQt+Feu2ypBoPNhAS4tXZ70Z18vBZTk/Idr2hZ1rwyi3YzOb
         /LCmKJM0SJzE36XAHu8bV9cmOplukGtUr2kCnKw/+l5yfTh0WwI9f9JpgS6LDM9eH/j4
         YRPwyKT0pHfGfLsym8Sp9WgicTklmx7t0qCQUXF7Yz1OuAIDKpbQm5wCZcJ4IWTrkrs5
         X97wuIeIydqMeolgz/shbC78x0REKBPKXgQSXAS7sb8opjm6VDLNs7q1i6OeFjCACtLS
         sRjZ9eJw03Bke/2h3fTa8VrDKuzpsCoRfaopgw9oxunTLY9gmCKs9qp8vdvMmyx1rsGR
         x3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ygp4m3e21yduhfv+GJMy4zBm6kfVmnItJHaRjESclks=;
        b=IhQHgcVrd2V3quBqZEMoZmN7hLOyHAzBpO85MPTwco9fbB7tp17uKO8BAvzehT6Uiq
         HfEVu8xVOb1vG/F/qfOZ0FgONN4rftL5hVtZZN5CjX8OVN+M3OVl+/Zo8xFSbNauuwyj
         DXNtkjTcqlZbkRQKO+k2yDTFNwJOlerRTqkHRfdHKBB4XmC6sswS+KgTpJ5PmXPfdlFp
         QT0FuurdENaNOFUGcR7qQRAI2BG1yjtCDfZLWMHxo+kG+DVs7sKXm6DG1HSwb59KfQw3
         QxTdJG0CqDbL/PHKWnzHx0bCMgOncXlhnwndPanYPC9XsGTHX/VehTDHQ1Kbm3R/+vVo
         /EEw==
X-Gm-Message-State: ANhLgQ3O2ezI8L3DTxooxG1Fob+rxpNZjRDQUBvZycv2/KdpyHq394Qh
        QWYRS6tLfwnEBFpbnXFEMpj5bDspWKc=
X-Google-Smtp-Source: ADFU+vtGFJOgKBqrH1ljsAV97C+6mn0esje7GfD8Gqb/eyrh3KVZAoIghgEBwnRWyUG2uJgvC/H4Bw==
X-Received: by 2002:a17:90a:c392:: with SMTP id h18mr5453571pjt.89.1585308573826;
        Fri, 27 Mar 2020 04:29:33 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id kb18sm3887419pjb.14.2020.03.27.04.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 04:29:33 -0700 (PDT)
Message-ID: <5e7de39d.1c69fb81.316be.ef24@mx.google.com>
Date:   Fri, 27 Mar 2020 04:29:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc1-51-gffa91e7ca142
X-Kernelci-Report-Type: build
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel build: 6 builds: 0 failed,
 6 passed (v5.6-rc1-51-gffa91e7ca142)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed (v5.6-rc1-51-gffa91e7ca142)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-51-gffa91e7ca142/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-51-gffa91e7ca142
Git Commit: ffa91e7ca1426a89eec1b3101286d82785760767
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

---
For more info write to <info@kernelci.org>
