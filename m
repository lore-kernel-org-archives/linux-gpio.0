Return-Path: <SRS0=hMLb=2E=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93654C43603
	for <linux-gpio@archiver.kernel.org>; Sat, 14 Dec 2019 03:22:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A5DC24125
	for <linux-gpio@archiver.kernel.org>; Sat, 14 Dec 2019 03:22:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="XdGfAb6z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbfLNDW2 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 13 Dec 2019 22:22:28 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:35279 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfLNDW2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 22:22:28 -0500
Received: by mail-wr1-f43.google.com with SMTP id g17so869813wro.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 19:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=u4gRiWbPS/DUFgxSdBUmbig8/O8DG7ujf/x7xOez4K8=;
        b=XdGfAb6zxNsGg+RisutRFTfzfWwBH+Zgbbebt5YmOzHOsjFU/FIGEjqoaBkLPZvUe8
         fP+E8SZ5xhESGtXQgEsjEAtGtmpqmTMpox3hsUKaG6/V2eXj9vMm6p0rQ0VrBJ9giUbk
         ux2ysJHsoE/oplS2iT1BqTo9lfUOGzDLmEQVHR8/R81gZMcDpstpa7kMarViU6NJ7Fla
         IsdWgYUEFOItXMS/txtlYcv5/sD8oDHMBLnZZUTDKRsv0kGX2N/u7lTVDtNDCS308BI6
         txnK/0AELdhHDaKjkyrpkMVgucBK5f1A7Uu5TBXs1ZBkHiufR1jew0aGzp7Fy5bE7kvf
         fZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=u4gRiWbPS/DUFgxSdBUmbig8/O8DG7ujf/x7xOez4K8=;
        b=jsfgcqtmdoZ9dHMYVYNAhWoBzGAjCbsftxFdkMk/x35qAoCCIgFqUHdNlryG/joZGC
         8b0VQAome5s7oYinDaCBsybkVygPR+niCWdAtKA5OaoidMrSTsxo5yxjxkuuxfJoyDFu
         mSOHY218njvCKzLIH+P3LY6BOdpdM1gT/j9y321Xy5CfZU0tDAepjUjfAPy72YUq80+A
         xEp/Ydwg6ZJyIMCMnKsX9woP2DSO3Mhh4VCeTn843r3yNVP3p2DSZK3c2lgCI4/+XOQi
         sIxOiX8kGwhwBLVoy4Fv733aT6JwTzaYxMMhY5DjgBPZQ1apUrQv/ThFGHA6nTwiCbwj
         zTAg==
X-Gm-Message-State: APjAAAUhETCwOy25eFxAb5rDQfdpkzSByxsSxdaLsE1USwFTZD9acbRK
        9DJtjS+Cr1onDywHGqFFYpB6BySivwg/MQ==
X-Google-Smtp-Source: APXvYqw5TusklvGjKDNptsFBhmKRNq54kju9BkYAWS/6w4QAFERmLtCgd8mD0D4/WeRXOGIa5T0RVQ==
X-Received: by 2002:adf:e40f:: with SMTP id g15mr17217297wrm.223.1576293745984;
        Fri, 13 Dec 2019 19:22:25 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u22sm12960628wru.30.2019.12.13.19.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 19:22:25 -0800 (PST)
Message-ID: <5df45571.1c69fb81.7e5a.2b16@mx.google.com>
Date:   Fri, 13 Dec 2019 19:22:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc1-7-g894731a5c9d0
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 42 boots: 0 failed,
 42 passed (v5.5-rc1-7-g894731a5c9d0)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 42 boots: 0 failed, 42 passed (v5.5-rc1-7-g894731a5c9d0)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.5-rc1-7-g894731a5c9d0/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.5-rc1-7-g894731a5c9d0/

Tree: linusw
Branch: devel
Git Describe: v5.5-rc1-7-g894731a5c9d0
Git Commit: 894731a5c9d0ea801a7ea1aba2f7c7b69fef6e85
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 42 unique boards, 13 SoC families, 3 builds out of 5

---
For more info write to <info@kernelci.org>
