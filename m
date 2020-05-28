Return-Path: <SRS0=117c=7K=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14304C433E1
	for <linux-gpio@archiver.kernel.org>; Thu, 28 May 2020 18:11:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF355207D3
	for <linux-gpio@archiver.kernel.org>; Thu, 28 May 2020 18:11:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="NFa7L+AS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405706AbgE1SLm (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 28 May 2020 14:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391470AbgE1SLD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 14:11:03 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93358C08C5C8
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2020 11:11:03 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f3so1131470pfd.11
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2020 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pacyrEOPzYr7Z5mcqozhjU4Zd3EobUCi3PTrAfcJJ6U=;
        b=NFa7L+ASVDOUuaZjBk/KvkCOb+j2zq/vTg7BeI08mO1/zH93cEsbk3N0sl1hzt36wR
         aGDMek8uzIIgBIJ0CnSRYgKus1QXEsWEc9nyAe+s7IwUKf1XJSUSUPeO0/w/dRGFAkPA
         nR36tT0at43hqw3sGnhEQRxTkpPvGEA9sFoYr/V3NfU1z2UkMCOZsAqZAqd39y+2s/7P
         QrEOOZ5427d6l3LtwB26p0A3GQrCh5o9oW5db8Cf8NUKlVa0eGWdei9BJI7DPzkqwkD7
         mAALw963NdretcHcXxYqpOm0h1eE3qKV6MuSHMn9OxhAasQm7yF4aotJpg07UqQaPw9r
         hRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pacyrEOPzYr7Z5mcqozhjU4Zd3EobUCi3PTrAfcJJ6U=;
        b=RssbQauMG4srrjJDVnCVsvovfmRJ157hrMSpRpkFJRfGph7mviYPECmOKWGljTF2F1
         HKCy7WrlHVWr7ulNiOgveYNUJ0l7O82mBmvt9Mht/8SjofgYT3kMkO0sr84dceMgXimf
         lilyB+3ToRZ94+h0Tn32rK2pGGBa1CEwuhK96Zlo/UH935uDizkXYbqSUduof9psS9uP
         gnh3gPRwWUSPj+JSQpkHDC3FcOqwUr8MdnXWeJmNnnOh8nCLHyaSIut89mEZr+EJwEuO
         J1Gn4tncDPhrBSnIxodfg9S+hkgNqpwSz00s1P7bWiHHLvq6yaNY8LZ4qXKQ7jFDW/lT
         Le/A==
X-Gm-Message-State: AOAM532O+pP5URl4HP1FnVr/uLPbjtgITfWPoA3QaaKrvIZnmxujk0/A
        trBV4GiVvT+28mKP94l41tpynDNYx08=
X-Google-Smtp-Source: ABdhPJwUWMAjkJ4BZjaIx3A+0/T+ijZMrsb8fsQmY3dZlgre5av1czpYwxD9oCIhjt35SW8B9o7zrg==
X-Received: by 2002:a63:1323:: with SMTP id i35mr4228215pgl.311.1590689462687;
        Thu, 28 May 2020 11:11:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t2sm5006870pgh.89.2020.05.28.11.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 11:11:01 -0700 (PDT)
Message-ID: <5ecffeb5.1c69fb81.2ea89.b5bb@mx.google.com>
Date:   Thu, 28 May 2020 11:11:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.7-rc6-84-ge47b16ebc068
Subject: linusw/for-next boot: 53 boots: 1 failed,
 51 passed with 1 untried/unknown (v5.7-rc6-84-ge47b16ebc068)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

******************************************
* WARNING: Boot tests are now deprecated *
******************************************

As kernelci.org is expanding its functional testing capabilities, the conce=
pt
of boot testing is now deprecated.  Boot results are scheduled to be droppe=
d on
*5th June 2020*.  The full schedule for boot tests deprecation is available=
 on
this GitHub issue: https://github.com/kernelci/kernelci-backend/issues/238

The new equivalent is the *baseline* test suite which also runs sanity chec=
ks
using dmesg and bootrr: https://github.com/kernelci/bootrr

See the *baseline results for this kernel revision* on this page:
https://kernelci.org/test/job/linusw/branch/for-next/kernel/v5.7-rc6-84-ge4=
7b16ebc068/plan/baseline/

---------------------------------------------------------------------------=
----

linusw/for-next boot: 53 boots: 1 failed, 51 passed with 1 untried/unknown =
(v5.7-rc6-84-ge47b16ebc068)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.7-rc6-84-ge47b16ebc068/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.7-rc6-84-ge47b16ebc068/

Tree: linusw
Branch: for-next
Git Describe: v5.7-rc6-84-ge47b16ebc068
Git Commit: e47b16ebc0681c6241a2ac794b21ae846a78bf91
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 46 unique boards, 15 SoC families, 3 builds out of 5

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 107 days (last pass: gpio-v5.5-4=
-45-gd18fddff061d - first fail: v5.6-rc1-12-g612e35e76ec8)

arm64:

    defconfig:
        gcc-8:
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.7-rc6-69-ga3bc02eb6f=
e3)

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

---
For more info write to <info@kernelci.org>
