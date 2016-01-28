From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] Documentation: minor correction of gpio dts example
Date: Thu, 28 Jan 2016 10:15:56 +0900
Message-ID: <CAAVeFu+G-_1O09R77sQ8zCkk=BxMx6YpoTvaOyyoqn85NQxfEw@mail.gmail.com>
References: <1453909091-16955-1-git-send-email-wr.phallsma@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:36174 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965598AbcA1BQQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2016 20:16:16 -0500
Received: by mail-ig0-f181.google.com with SMTP id z14so2487363igp.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2016 17:16:16 -0800 (PST)
In-Reply-To: <1453909091-16955-1-git-send-email-wr.phallsma@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Per Hallsmark <wr.phallsma@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Per Hallsmark <per.hallsmark@windriver.com>

On Thu, Jan 28, 2016 at 12:38 AM,  <wr.phallsma@gmail.com> wrote:
> From: Per Hallsmark <per.hallsmark@windriver.com>
>
> As the example brings up two ranges of 10 pins each, the count
> should be 10 in both range definitions.
>
> Signed-off-by: Per Hallsmark <per.hallsmark@windriver.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index 069cdf6..ad3d64b 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -252,7 +252,7 @@ Example 1:
>                 compatible = "fsl,qe-pario-bank-e", "fsl,qe-pario-bank";
>                 reg = <0x1460 0x18>;
>                 gpio-controller;
> -               gpio-ranges = <&pinctrl1 0 20 10>, <&pinctrl2 10 50 20>;
> +               gpio-ranges = <&pinctrl1 0 20 10>, <&pinctrl2 10 50 10>;

Looks correct wrt. the description that follows, thanks!

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

One nit: please make sure to run scripts/get_maintainer.pl on your
patch and email the maintainers of the subsystem you are submitting to
directly. It usually makes your email more visible in their inboxes
than if you send to the mailing-list only.
