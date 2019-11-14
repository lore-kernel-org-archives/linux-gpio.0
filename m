Return-Path: <SRS0=vzOO=ZG=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C72C432C3
	for <linux-gpio@archiver.kernel.org>; Thu, 14 Nov 2019 15:00:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86CC6206D8
	for <linux-gpio@archiver.kernel.org>; Thu, 14 Nov 2019 15:00:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="19r8p+K9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfKNPAv (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 14 Nov 2019 10:00:51 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:41603 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfKNPAu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Nov 2019 10:00:50 -0500
Received: by mail-wr1-f41.google.com with SMTP id b18so5354194wrj.8
        for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2019 07:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0TgDVIvx3EeCSRdfzY3RKDdBP5+3LP0PqX4+3UCKYoc=;
        b=19r8p+K9rO1MCA6wmz6Na3EalCe9UJovC8xCOQj5roAVjtAQtcBs7oX800R9I/sP+3
         mc29NR85q9cmQjXgGEFpneiIuI0y9Y9UaUD9tL/0IUWgMkjBMpX7+0U3vlDgpjCcfT5z
         YlAHll5RYQ808n4cbiQ2vJE0RvKcgwcUihR1NvfC2AXcZGQO+MzRD/OB5JamJT5Wh8Gg
         FkpFnJ/oMr3xmAIEGXV2TEall75uMuwy/pwNXu025hOsqxMIYJ90swqBQsdskaZgL3Sn
         G1k4UK9O0Fsx++/qTuJKmk+orcvM+iXEd5lZ43X4zgfv+Q11J5C9mTH9Hyhfr0YNwxiw
         FT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0TgDVIvx3EeCSRdfzY3RKDdBP5+3LP0PqX4+3UCKYoc=;
        b=j6v9QzLxMIwhIWRsdUZezpwLyBRapbnupd/BHRHSx28gzcxCLg2j3EpQPozntYt5bi
         T0dgxO18FXYYbZ/2yDwkeHUh0EUT82Zl4aepTsEJIDTkUTa7DEwH8ti/emCOiAhb6Y4T
         hvrT8ID+Db89dkZrFSsEGUxGQ7/I5Lx2UC/NubTQHUNl0xqGsrzYukYw/y8jW1YODqMk
         HPwDyJnYotLMbtpraKwkzXzfv2n8hkpYS8z3zl6QJbSuTIkFnXOvDdPOKr8XKrdrhysn
         uVt7e3/WDJrTJms9nwZMLOFA+QXD8gdDW7ousNh/v3SQV8sAm73sg52Jprl3z21nzE24
         OejQ==
X-Gm-Message-State: APjAAAVkPCZZcTPCOuOZFuWCZAnGBf0HdwqN+cDIIwBLCSdqxQAtGXCU
        WNKhkOhcF+DLNVYmcFp38VE1YQxm9S7j5g==
X-Google-Smtp-Source: APXvYqyzUK9/iNKCGswfruFFa/dgqZmSXH99Zcz7/rkm4lDnok7tbggzJ9fDvIjmnW21ylutKOc2PQ==
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr9279711wra.194.1573743648580;
        Thu, 14 Nov 2019 07:00:48 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a11sm6674989wmh.40.2019.11.14.07.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 07:00:47 -0800 (PST)
Message-ID: <5dcd6c1f.1c69fb81.edf9f.f5c1@mx.google.com>
Date:   Thu, 14 Nov 2019 07:00:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc7-124-gd0d9531e38a6
Subject: linusw/for-next boot: 49 boots: 0 failed,
 49 passed (v5.4-rc7-124-gd0d9531e38a6)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 49 boots: 0 failed, 49 passed (v5.4-rc7-124-gd0d9531e=
38a6)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.4-rc7-124-gd0d9531e38a6/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc7-124-gd0d9531e38a6/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc7-124-gd0d9531e38a6
Git Commit: d0d9531e38a6ccd0b4e32acec85d564b677dec41
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 41 unique boards, 12 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
