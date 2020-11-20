Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFF0C56201
	for <linux-gpio@archiver.kernel.org>; Fri, 20 Nov 2020 14:51:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D87942224C
	for <linux-gpio@archiver.kernel.org>; Fri, 20 Nov 2020 14:51:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech header.b="GFh/89Yt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbgKTOvj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 20 Nov 2020 09:51:39 -0500
Received: from mail.heine.tech ([195.201.24.99]:51516 "EHLO mail.heine.tech"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727215AbgKTOvj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 20 Nov 2020 09:51:39 -0500
X-Greylist: delayed 554 seconds by postgrey-1.27 at vger.kernel.org; Fri, 20 Nov 2020 09:51:38 EST
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 57F4218150E;
        Fri, 20 Nov 2020 15:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
        t=1605883335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
         content-transfer-encoding:in-reply-to;
        bh=pqcm0w2d9wkfjXqhi1sb/LOEULtdPXrKD/1tj4351ZA=;
        b=GFh/89Yt/Kazi1e8egkHn3tAorWf8cIRLKxpKMcnkqwMM9fVNc2y4jIAESsrjLkONoXudy
        JK/GkOWKE5MvtnzgUfxQNWYAjTLFXVITnX1rz+LG4G2VVge2qSCd1g+hZZET9nOIMkRNJF
        6LwNakS1nVyfIJvCmZYYMRPD9zReyg0=
From:   "Michael Nosthoff" <buildroot@heine.tech>
In-Reply-To: <20201120141539.11025-1-brgl@bgdev.pl>
Content-Type: text/plain; charset="utf-8"
Date:   Fri, 20 Nov 2020 15:42:15 +0100
Cc:     "Kent Gibson" <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
MIME-Version: 1.0
Message-ID: <5fff-5fb7d600-1-776b3000@96844491>
Subject: =?utf-8?q?Re=3A?= [libgpiod][PATCH] =?utf-8?q?build=3A?= allow building 
 with pre-v5.5 kernel headers
User-Agent: SOGoMail 5.0.1
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Friday, November 20, 2020 15:15 CET, Bartosz Golaszewski <brgl@bgdev=
.pl> wrote: 
 
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> libgpiod v1.6 requires at least v5.5 linux kernel headers to build. T=
his
> is because several new symbols have been defined in linux v5.5. In or=
der
> to allow building with kernel headers v4.6 and on, let's check the
> presence of the new symbols and redefine them if needed.
>

In the Buildroot Package (for 1.4.x) you set the dependency for headers=
 to be at least 4.8. [1]
Could this then be lowered or is there a mixup?

Regards,
Michael

[1] https://git.busybox.net/buildroot/tree/package/libgpiod/Config.in

