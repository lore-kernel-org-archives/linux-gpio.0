From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND RFC PATCH 0/2] fixing the gpio ownership
Date: Fri, 19 Jan 2018 22:02:39 +0100
Message-ID: <CACRpkdaOq=iV5zNG8cXqH_ThF7Aj+GJL0HxA9pBLSvHtd96mrA@mail.gmail.com>
References: <20180115162407.6314-1-ludovic.desroches@microchip.com>
 <CACRpkdbNqn-MJuzq=BpbNYveD-F8Hee2NY6ny4-SJL+F=wHq7g@mail.gmail.com> <20180118151211.GW2989@rfolt0960.corp.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180118151211.GW2989@rfolt0960.corp.atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 18, 2018 at 4:12 PM, Ludovic Desroches
<ludovic.desroches@microchip.com> wrote:
> On Thu, Jan 18, 2018 at 11:16:44AM +0100, Linus Walleij wrote:

>> > It seems
>> > that more and more drivers are converted to use GPIO descriptors so there is
>> > some hope.
>>
>> Yeah I'm doing this when I have time. There is plenty of work...
>> Help appreciated.
>
> I will try to handle the ones related to the platforms I am using.

I'm looking into SPI and regulators for the next kernel cycle, so
those will hopefully get fixed.

Yours,
Linus Walleij
