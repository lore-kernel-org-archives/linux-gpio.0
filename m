Return-Path: <SRS0=wwON=YI=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDE2C4CECE
	for <linux-gpio@archiver.kernel.org>; Tue, 15 Oct 2019 02:29:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F07D206A3
	for <linux-gpio@archiver.kernel.org>; Tue, 15 Oct 2019 02:29:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="kA/N1aUc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfJOC3j (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 14 Oct 2019 22:29:39 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34560 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726974AbfJOC3j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 22:29:39 -0400
Received: by mail-wr1-f65.google.com with SMTP id j11so21829304wrp.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 19:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1FzrgBv9j4hbBjN6P+ZKBQD03DWsHr/qTKga30Vzz1k=;
        b=kA/N1aUcsP+tRFhg3kUFMrFaSNiDP6SA6Xs/+/ROgtoUMVQ8fDT/Kry82yO3kEcOwG
         Yvaf2tCKGrSmO2d53yy9EcNOaFCgyn341lFuZtqhSNJtaLJAwdJiLSZE4tF6zoXkCG7+
         Q/AjGfwkOg4m/sH3SPxZR6ntysLLdR8Nzw2wssZzDgB9edZjVegVnwZoojDRffRqGvIS
         PSVvDzpsgXif8z59ufg5CbQpFlQDmKEflnlYGHOpiwZoIrinImCYoGeqPV0SNOPz6Yh/
         ydLGys1eE/TOlb+ynIvd0cvwxusLW/dsjJkVnIz3Z8KS7C+v7z8sZ3w0m2hkA0nqzwjo
         Pr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1FzrgBv9j4hbBjN6P+ZKBQD03DWsHr/qTKga30Vzz1k=;
        b=GPe1DgU6u1EppZaMrtwKjIKxSBc+2CZ1azwcbDZDOrLRRQ37r1FIiaV7y7mR03x2JL
         /1M14/iDw0E2/TsEAPwVPcNJ1vO3X6cn0UpsdegmCh2KH5FYpJlyeBhCL+HtRNAtopFj
         jbkZ0sN3i8gWu31vRND/cET83Iqa4s4LOwWOF4xGLe//KWvXa0aPRv+5F/IHkr7WdZhl
         /0M2hr/ySdwnbWwZVve8pjKTy2MMBBXRamPFGJJlU7VWCfkfwzXa9HC8LVyXkWPkQyfA
         pGojVEmoBk65N88CTjMK+yxQBW+qWF1Ts7oQDaAT/FgoGFqZyaaby3zmV4jGN/AMm78r
         Eyxw==
X-Gm-Message-State: APjAAAWaJrw+s9lbi4KWX3ZphskCqHvaZKAFiNKFMN1GoSZ2IHnuX/zz
        +/9HJRHwgX5PW8udvlcrq2sMHNnApJ4yPA==
X-Google-Smtp-Source: APXvYqyuH75wY4gpfHBdldikBX5j4hi+LsUlSC6SrHvjsk93rEJ8llR5Pl+kXjaDS1a68PwEq1WxAw==
X-Received: by 2002:adf:f18a:: with SMTP id h10mr3983630wro.145.1571106577115;
        Mon, 14 Oct 2019 19:29:37 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id h125sm28545893wmf.31.2019.10.14.19.29.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 19:29:36 -0700 (PDT)
Message-ID: <5da52f10.1c69fb81.5a1eb.8783@mx.google.com>
Date:   Mon, 14 Oct 2019 19:29:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc3-18-g818633792f6c
Subject: linusw/for-next boot: 42 boots: 0 failed,
 42 passed (v5.4-rc3-18-g818633792f6c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 42 boots: 0 failed, 42 passed (v5.4-rc3-18-g818633792=
f6c)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.4-rc3-18-g818633792f6c/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc3-18-g818633792f6c/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc3-18-g818633792f6c
Git Commit: 818633792f6c582190de8cb05ca21cdd12d04f55
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 39 unique boards, 13 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
