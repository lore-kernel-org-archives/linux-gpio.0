Return-Path: <SRS0=plmd=ZR=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85F1C432C0
	for <linux-gpio@archiver.kernel.org>; Mon, 25 Nov 2019 12:31:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A18262082F
	for <linux-gpio@archiver.kernel.org>; Mon, 25 Nov 2019 12:31:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="xcYZdJ5q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfKYMbb (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 25 Nov 2019 07:31:31 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:53097 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbfKYMbb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 07:31:31 -0500
Received: by mail-wm1-f43.google.com with SMTP id l1so15243343wme.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 04:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eSPibx2zcCI1TXIzbj5RRyPqZbO3d0yYJn8xHNQXGkI=;
        b=xcYZdJ5qOAEfWeDBbJMgDQFLVKAnfBCJPZeKx5Ub9c9ekUdBgqHi/ek2bePbYqS+Wn
         NtJmS1VJ1ZFTp1Uy/PUt/HQoaL7ZhrJhyqgCYikE97QVjerGVHUxQkXCdQPJFdN6qLEn
         VpC+gUQNbdw8NrJYA4YFZK1oHVvPqh4luFyVUK7kUjzLC2qdvkmmJKHay88GrNif+6ws
         Km5Qi3VSN5QI6GcD0K2sDeNkpnbOTvTIx+JI1BaXNwabt7RSrSHLzuJM/lByxXX4MtXc
         KnuDNF0y0rZre/3t/KNj2iJVikLdgkFBXNphAZgAqu9AEEejjzgd+ezE0cXz4StZJJQx
         mWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eSPibx2zcCI1TXIzbj5RRyPqZbO3d0yYJn8xHNQXGkI=;
        b=r5uzITSpRsWkmwAqpso2eQd8OUrU+2LcxozzVzZbEGJLUJ/oEV9+MlLFeai/NCxBtR
         kAvkKRizpuIRXZDJqg8iafDVHf2ruWN0fq+qBqOfg9fpYXIvSrpj+T0F90WYGq7hNpP7
         Ytknw44wGa6AyiaWpQH8EZzq/9kHbDgYBz7MtI/8yhq3MldEIYXhFPKzP83b5Dja69vh
         z99aHc3DSVdG2eGIObmSSmsUzzu2t8KIfMZkz/1bB2eItGACSmGF8tgCfa4yxQrx6dMw
         4+2NK4NuphWNAJ9S4XuRvSx/DcJWHdXn31aYaK+lyxuzJyk16ljxdkw5yAjG3KXKka0Y
         YHgA==
X-Gm-Message-State: APjAAAUGP0Qvg/nQkG9H/Bugrw8iZLg8CUj/2IWlb/RcXyUUaFapnhze
        Keq/rDJ6ylW6fxQ61RyqcjeWI4Ss4o85Rw==
X-Google-Smtp-Source: APXvYqybb7wRGZKWcQCU6BcgOY4kf2eOTjm7p3vSQAtKlcHiXNauCo9w3HPLmwDqByn6bno1d7+lVw==
X-Received: by 2002:a1c:2245:: with SMTP id i66mr10155942wmi.86.1574685089232;
        Mon, 25 Nov 2019 04:31:29 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j67sm8571138wmb.43.2019.11.25.04.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 04:31:28 -0800 (PST)
Message-ID: <5ddbc9a0.1c69fb81.75e0f.b3ba@mx.google.com>
Date:   Mon, 25 Nov 2019 04:31:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.4
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
X-Kernelci-Report-Type: boot
Subject: linusw/fixes boot: 51 boots: 0 failed, 51 passed (v5.4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 51 boots: 0 failed, 51 passed (v5.4)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.4/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.4/

Tree: linusw
Branch: fixes
Git Describe: v5.4
Git Commit: 219d54332a09e8d8741c1e1982f5eae56099de85
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 41 unique boards, 14 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
