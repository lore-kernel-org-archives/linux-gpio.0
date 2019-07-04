Return-Path: <SRS0=Yh4R=VB=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB058C0650E
	for <linux-gpio@archiver.kernel.org>; Thu,  4 Jul 2019 07:58:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6CFF62189E
	for <linux-gpio@archiver.kernel.org>; Thu,  4 Jul 2019 07:58:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LVUPFksP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfGDH6S (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 4 Jul 2019 03:58:18 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46474 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfGDH6S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 03:58:18 -0400
Received: by mail-lj1-f195.google.com with SMTP id v24so5181450ljg.13
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2019 00:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n0xpW2ibDyrnyCK0FqEAmoqkqWHkD/HVqg1gGhqUKtc=;
        b=LVUPFksPbZtrTI0XIpZkEMr6R2/1XDcut443r9iKzA3rXkp4bhRO9OLPycGVTwWa6+
         jZ7EO+8ipGlD9EdfXKM2K8tK6uJCghxwntwOMKlr8ggAiWwSGhS9J5hLOnvedZxqwVF6
         9goXrR7qpSKKP7j/H2cRq11nLyhr6UpR+wdxhHD+GnD1pCFHucyqWHt19kFGmsbrAW4d
         gTL5hSZBEhdYmY8J3tUeeP3DXrUXlerob1s3yy+7H1roKEnq88+NT2b4ZHCVc4GvXF0N
         TR2DYbakGm2VAg3sb0A1v8zTpjhFZPAgTJV7IXT3pfQcn6VFum0T95JT6GbzhjrQ5By4
         emzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n0xpW2ibDyrnyCK0FqEAmoqkqWHkD/HVqg1gGhqUKtc=;
        b=Raw0o3Rk6rv86Yh6fEc8HEVpo/okNNW5O77ATZTmpx+sv6drZLDTX5kZN7+L3MBx5G
         Ut1BVrWUbhXPB2uVpHf/7gAXJ9kxiG4mHLpOpVkl30zv7auSoQqw4pGsCGr9mji52H1n
         r4ZfhXl4QreFaOrdhD3T2Au60PHqG0PSj/dx7r6McgUkFWSJ0GxXhTSYV7TOgZZXsb7m
         5aFY29BJcpFUDGsRcy+987+AyKvq8YxUDMlLbE8/ium/OlIhdlVCsT+1+JrYZC2jkVR4
         TPGRG/QVJdWavOjulNokJ/Hh4ZQPGFGcYz7uXHB2atKoxJ2e5ljLpSldrGx+itIog+9W
         6GtA==
X-Gm-Message-State: APjAAAVEz1d1Hjq5d80wjM2XrvbuQDERkF0qITzg+Sgui5GSfHhEkfuU
        0BB/oiVqp3d+EnPfnGIQNz0v5W0WODEna+72US/mcg==
X-Google-Smtp-Source: APXvYqyl5VIiLDWQ+nycKGd+u4jnA0CHUihFeUWeRla7bv2dM29kP6FY7P9VhaxRB37i/msSDklJUyvfhnRe2ZdqoP4=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr6791629ljj.108.1562227095897;
 Thu, 04 Jul 2019 00:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190703151554.30454-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190703151554.30454-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:58:04 +0200
Message-ID: <CACRpkdbg7-PKY=6q=sy2JurUzDHNV7Hf-2amDAn-FBhPhZ6HEw@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: baytrail: Use GENMASK() consistently
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 3, 2019 at 5:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use GENMASK() macro for all definitions where it's appropriate.
> No functional change intended.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
