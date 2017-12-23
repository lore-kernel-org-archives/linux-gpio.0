From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] gpio: of: make example syntactically correct
Date: Sat, 23 Dec 2017 13:06:47 +0300
Message-ID: <a3e5175c-5a93-21e3-21e6-4df360bdc390@cogentembedded.com>
References: <20171222200840.8317-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:44011 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750713AbdLWKGt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Dec 2017 05:06:49 -0500
Received: by mail-lf0-f66.google.com with SMTP id o26so19606261lfc.10
        for <linux-gpio@vger.kernel.org>; Sat, 23 Dec 2017 02:06:49 -0800 (PST)
In-Reply-To: <20171222200840.8317-1-wsa+renesas@sang-engineering.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Hello!

On 12/22/2017 11:08 PM, Wolfram Sang wrote:

> The ';' was missing.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   Documentation/devicetree/bindings/gpio/gpio.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index 802402f6cc5d89..53e0a0e01a4ee0 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -33,11 +33,11 @@ The following example could be used to describe GPIO pins used as device enable
>   and bit-banged data signals:
>   
>   	gpio1: gpio1 {
> -		gpio-controller
> +		gpio-controller;
>   		 #gpio-cells = <2>;

    Could as well remove extra space on this line...

>   	};
>   	gpio2: gpio2 {
> -		gpio-controller
> +		gpio-controller;
>   		 #gpio-cells = <1>;

    ... and this.

[...]

MBR, Sergei
