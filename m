From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH gpio] gpio-amd8111: check ioport_map return value
Date: Wed, 14 Jan 2015 13:31:10 +0100
Message-ID: <CACRpkdZihBJfgm-_HZ-pPg_wj8zaHJAsPEPio1ff2=9Z756YmQ@mail.gmail.com>
References: <1419842341-22694-1-git-send-email-varkab@cdac.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:49465 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752285AbbANMbL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 07:31:11 -0500
Received: by mail-ie0-f180.google.com with SMTP id rp18so8411708iec.11
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2015 04:31:11 -0800 (PST)
In-Reply-To: <1419842341-22694-1-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Varka Bhadram <varkab@cdac.in>

On Mon, Dec 29, 2014 at 9:39 AM, Varka Bhadram <varkabhadram@gmail.com> wrote:

> ioport_map() may fail. Its safe to check the return value.
>
> Signed-off-by: Varka Bhadram <varkab@cdac.in>

Patch applied.

Yours,
Linus Walleij
