From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 2/2] gpio: add TS-4800 fpga GPIO support
Date: Thu, 4 Feb 2016 09:16:06 +0900
Message-ID: <CAAVeFuJXUyKDXign_wGbCxdKgXE1DHHjPdsw0zm+n6gNtB_3RQ@mail.gmail.com>
References: <1452704263-16763-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
 <1452704263-16763-2-git-send-email-julien.grossholtz@savoirfairelinux.com> <880790340.75681.1454338503610.JavaMail.zimbra@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:35419 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751494AbcBDAQ0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2016 19:16:26 -0500
In-Reply-To: <880790340.75681.1454338503610.JavaMail.zimbra@savoirfairelinux.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Cc: linus walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel@savoirfairelinux.com

On Mon, Feb 1, 2016 at 11:55 PM, Julien Grossholtz
<julien.grossholtz@savoirfairelinux.com> wrote:
> Hello,
>
> Any chance to get feedback on this ?
>
> Thanks,
>
> Julien Grossholtz
>
> ----- Original Message -----
> From: "Julien Grossholtz" <julien.grossholtz@savoirfairelinux.com>
> To: "linus walleij" <linus.walleij@linaro.org>, gnurou@gmail.com
> Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@savoirfairelinux.com, "Julien Grossholtz" <julien.grossholtz@savoirfairelinux.com>
> Sent: Wednesday, January 13, 2016 11:57:43 AM
> Subject: [PATCH 2/2] gpio: add TS-4800 fpga GPIO support
>
> The TS-4800 GPIO driver provide support for the GPIOs available
> on the Technologic Sytems board FPGA. It allows to set
> direction and read/write states.
>
> It uses the generic gpio driver.

No fancy stuff here, looks good to me but let's see what Linus says as
I am not too familiar with the generic GPIO driver.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
