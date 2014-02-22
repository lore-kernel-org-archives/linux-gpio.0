From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 2/2] gpio-ts5500: Add dependency
Date: Sat, 22 Feb 2014 11:00:08 +0900
Message-ID: <CAAVeFuLkgK_td3aZQp3rAdbXkxe+3bDFBMD4FjFWk6cukTjWGQ@mail.gmail.com>
References: <20140214112824.27b98f1d@endymion.delvare> <20140214113214.70ed0b65@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f174.google.com ([209.85.128.174]:56110 "EHLO
	mail-ve0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754962AbaBVCA3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2014 21:00:29 -0500
Received: by mail-ve0-f174.google.com with SMTP id pa12so4060235veb.19
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2014 18:00:28 -0800 (PST)
In-Reply-To: <20140214113214.70ed0b65@endymion.delvare>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>

On Fri, Feb 14, 2014 at 7:32 PM, Jean Delvare <jdelvare@suse.de> wrote:
> There is no point in displaying the TS5500-specific driver entries if
> TS5500 board support itself isn't enabled.

Acked-by: Alexandre Courbot <gnurou@gmail.com>
