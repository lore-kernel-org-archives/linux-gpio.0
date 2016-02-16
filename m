From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: pisosr: Don't use magic numbers
Date: Tue, 16 Feb 2016 15:55:47 +0100
Message-ID: <CACRpkda2LXaPFHdqkonNwnRwv_YhTN3AoOsH-wTRoBZ+-J9shg@mail.gmail.com>
References: <1455527640-10446-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:33728 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932204AbcBPO4Q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2016 09:56:16 -0500
Received: by mail-ob0-f178.google.com with SMTP id jq7so77431759obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2016 06:56:15 -0800 (PST)
In-Reply-To: <1455527640-10446-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Feb 15, 2016 at 10:14 AM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> At first view I thought this function returned an error, but actually
> it is the input direction. Use the define for input which makes reading
> the code much easier.
>
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>

NACK that flag is for consumers, not drivers.
Drivers have their own API and should ideally
return a bool true/false, but that would be another major
refactoring....

Yours,
Linus Walleij
