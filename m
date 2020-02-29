Return-Path: <SRS0=+MJV=4R=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8C7C3F2C6
	for <linux-gpio@archiver.kernel.org>; Sat, 29 Feb 2020 23:28:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED8E4222C2
	for <linux-gpio@archiver.kernel.org>; Sat, 29 Feb 2020 23:28:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="nOq8qbuo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbgB2X2c (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 29 Feb 2020 18:28:32 -0500
Received: from mail-pg1-f177.google.com ([209.85.215.177]:43119 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgB2X2c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Feb 2020 18:28:32 -0500
Received: by mail-pg1-f177.google.com with SMTP id u12so3447825pgb.10
        for <linux-gpio@vger.kernel.org>; Sat, 29 Feb 2020 15:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=s7k/d0O+tEfXghCS+xVMw3+44xxzgGUmDWkvKdkzlk4=;
        b=nOq8qbuoz6kEWB0n1Tr3CG20UJf3iU2cX8vpiRK3uHTrf1ToGocjhpX5xXRbVueVEo
         WsIey3VzdHdCMPWFJ6G8Fh2ge9BPh9CIWBC9hFdGAd13hfM6WXTPNlDExY3j3AfRzwhL
         jyR/52Zwq4k6OQAzlbp7eB3E2q+TFFk89HvCBT/iTeSkwjHGTTexarJ4mV5e2uefnaWq
         KQn9l8h3kCkijHIBXvhEnruqwu3N2GR7KdrcvVtffYvuyMPFu84iQGIC21VaNLnYk8Wk
         WBapMCPxnFG2+bIeE8e3Wkj5RH5p1rjJ+HJUa/RKr98DMtXKEJ4YnwHmQb/FCZuXd3vB
         0FzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=s7k/d0O+tEfXghCS+xVMw3+44xxzgGUmDWkvKdkzlk4=;
        b=IKzwQYH4P4qsC/AeUXrmmpa3ibhhWqvKKgCHULqPou2uDIH4E2Wg/ctcSIh5fpvspY
         BYJqRawd5rIvgy8voyFzG0LhwZnarSR40hYemgPWAKnVTZ3vLdFEvRb4DIBAcZACX+X8
         Wyl4OpJMyk1l0MpUI0yLTlVivqbMO5VfWW5IpH/oFuHSfsUEySPKVkFOd4BBJy7B15oO
         zmelF6H1tngozMsDln9n9tWlaTTn4sF//N3wCI+qLrTUGL+fF7tc2QnLe61AeFhDDLOx
         zWZZXuyxjvaExULsYvRnB6PpDZHnRivssIRfuTwr9UiIruZawPpSRe1iW13+Yci3p9Dm
         jiFA==
X-Gm-Message-State: APjAAAUHXhsDeJXULD97GShGKG9REO9Ab0qi1d6h9shHr1IjP+XAHCOW
        CgI2Nhhb5zx2c/mmj3VsGLBZKrCLRw4=
X-Google-Smtp-Source: APXvYqx/12hNH4YLW9ZdZLDzQzgerpdiJRv4uxDVvdxhO5Ldggx1jjs68fA6Ag+3GxNSXGH+iwAy8g==
X-Received: by 2002:a63:ce03:: with SMTP id y3mr12215491pgf.427.1583018910780;
        Sat, 29 Feb 2020 15:28:30 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z30sm15877269pff.131.2020.02.29.15.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Feb 2020 15:28:30 -0800 (PST)
Message-ID: <5e5af39e.1c69fb81.3c772.9045@mx.google.com>
Date:   Sat, 29 Feb 2020 15:28:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Kernel: v5.6-rc3-21-g27a2a9a4fa1f
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
Subject: linusw/for-next build: 6 builds: 0 failed,
 6 passed (v5.6-rc3-21-g27a2a9a4fa1f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed (v5.6-rc3-21-g27a2a9a4f=
a1f)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc3-21-g27a2a9a4fa1f/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc3-21-g27a2a9a4fa1f
Git Commit: 27a2a9a4fa1f84d99a649134aab7367464a1762b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
