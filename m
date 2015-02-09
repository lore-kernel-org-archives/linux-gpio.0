From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2 1/2] basic-mmio-gpio: add DT support
Date: Mon, 9 Feb 2015 14:35:57 +0900
Message-ID: <CAAVeFuKgVKKrt1Omk+zm8Y6xcyuuj8mMAkjCn5jFsqoU1CwgNA@mail.gmail.com>
References: <5490B528.2020305@gmail.com> <54C51A85.4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:42828 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752373AbbBIFgS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Feb 2015 00:36:18 -0500
Received: by iery20 with SMTP id y20so5598283ier.9
        for <linux-gpio@vger.kernel.org>; Sun, 08 Feb 2015 21:36:17 -0800 (PST)
In-Reply-To: <54C51A85.4@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jan 26, 2015 at 1:32 AM, =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
> Add DT support while keeping legacy support.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
> v2: rename regset-nr to regset-wo and regdir-nr to regdir-wo.
> document DT bindings.

As Mark explained, you need to get the bindings approved by the DT
people first, so please send them to devicetree@vger.kernel.org (and
also directly to the DT maintainers) with a rationale for this, and
get their approval. There is no point in reviewing this code until we
have confirmation that it is acceptable in the first place.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
