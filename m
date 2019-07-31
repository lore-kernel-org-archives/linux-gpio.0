Return-Path: <SRS0=y42E=V4=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F316CC433FF
	for <linux-gpio@archiver.kernel.org>; Wed, 31 Jul 2019 01:08:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA355206A2
	for <linux-gpio@archiver.kernel.org>; Wed, 31 Jul 2019 01:08:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="kK8c5cyH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfGaBIG (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 30 Jul 2019 21:08:06 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:33872 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727136AbfGaBIG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 21:08:06 -0400
Received: by mail-wr1-f42.google.com with SMTP id 31so67760790wrm.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jul 2019 18:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FVrF2PQRDEjrJrAmvyJhOl0JvABAH+cyMzmOky7cIIo=;
        b=kK8c5cyHKdR2QNAXzyvc3pCh8egCsgJfkrxV5kv/pTAMyS64HitE2K7/1QKSLS4WDS
         lywAtQaC+NsQaWTyySJajCXjl1OV/xvcr3kXpJG3TcXJ7vQMz38wjfG2LMQwx+Mky1Mu
         ghuyL5MxI6B+Z6Mnu1ToDqImACcg2rYyle8VXDxb0GDBYPTaNPidvbOmd5phWZhBT2X1
         2ZR3//6D4Jry5Jz7mT11aoC8uyT7My4Xfp8xaGmdigsDC2CQQnX4no54oyi+4+w2lTvF
         HKEkdEkPbif1Wk/sAHCYXHD9Hdo4vRR0dhfAiFvBQF3Wflc1SQ/DAeIZ5qtMhgDCQyY0
         1GfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FVrF2PQRDEjrJrAmvyJhOl0JvABAH+cyMzmOky7cIIo=;
        b=JbrMJAOllKuKAnBkQMyPbn9PIWsnn0/ZqAAnJpyrhZo6uiF88sk4ow7lzETUYdUR1v
         ukCiRla7+/ILuRGDK51vQL9qamYCA9zT699ULoiLoPGXynqicSnWGdN5T06eBIkCXFd+
         srHob50914m3qcOYt1Z9z14Mti6IK/HqTxI7j9EgI8X0PRwvBRryavusMEGUc9w7dcGa
         2yJ3l/WWJ5yXW5HEFUheyq1dVOfy+vzsz2TbbemevKsOfXqGwVN6MvfU0tG+39gDHYHx
         WyQH+Ni5pbraJUmNO0ua88CHIp0wJM05whrFVdxhNiTG+Pc52Tdtfr9OjYRqS1Y88kc7
         QsCg==
X-Gm-Message-State: APjAAAWLSu86JiZCPfo+hsj7K8P9jJ7mQlGCt7U724kvZOqS6lO0uqCg
        IaphCnKCxN9Rpd/cin4qdisA6AJa/M0=
X-Google-Smtp-Source: APXvYqwU1m263Zyj03c0LqmE4g3kk2ld6y1XRWMpQESatSlnirDg+pUYU8MLRmtPKVg2gFuYOBftCw==
X-Received: by 2002:a05:6000:1148:: with SMTP id d8mr114748214wrx.354.1564535284108;
        Tue, 30 Jul 2019 18:08:04 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id h1sm49687865wrt.20.2019.07.30.18.08.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 18:08:03 -0700 (PDT)
Message-ID: <5d40e9f3.1c69fb81.5e542.97b6@mx.google.com>
Date:   Tue, 30 Jul 2019 18:08:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.3-rc1-8-g2838bf941b12
X-Kernelci-Branch: devel
X-Kernelci-Report-Type: boot
Subject: linusw/devel boot: 48 boots: 1 failed,
 47 passed (v5.3-rc1-8-g2838bf941b12)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 48 boots: 1 failed, 47 passed (v5.3-rc1-8-g2838bf941b12)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc1-8-g2838bf941b12/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc1-8-g2838bf941b12/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc1-8-g2838bf941b12
Git Commit: 2838bf941b120ec846a3903db13e319368d51b08
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 34 unique boards, 15 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 1 day (last pass: v5.2-10808-g9637d5=
17347e - first fail: v5.3-rc1-5-ga299726da44f)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab

---
For more info write to <info@kernelci.org>
