From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: How to ensure other module/driver is initialized?
Date: Thu, 26 Jan 2017 15:51:12 +0100
Message-ID: <CACRpkdZFBCv_vHn2pH7b-Ue-hA6bQw7QTbVZ8zi3W_3xBymBuA@mail.gmail.com>
References: <180b9075-7db0-1708-50f4-622333de2049@gmail.com>
 <CACRpkdYjUKimX+R0nZv5v+rhdUxAUtKv4pPu0dtGAYhEP1Ri7Q@mail.gmail.com> <6a8fe8d3-024b-1cf7-0e2e-1421042036da@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6a8fe8d3-024b-1cf7-0e2e-1421042036da@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Pilcher <arequipeno@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 24, 2017 at 5:40 PM, Ian Pilcher <arequipeno@gmail.com> wrote:

> Device tree presents even greater problems.  It's not clear to me that
> device tree even works with x86_64, and even if it does, I'm almost
> positive that none of the "generic" distributions are going to support
> it.
>
> If my understanding of device tree is inaccurate, please do let me
> know.  I'd definitely like to replace the "board" module with a
> device tree description if it's possible.

Sorry for my ignorance. I thought this was some ARM or MIPS thing.

It should indeed come in as a board file for x86 systems,
unless they have ACPI to do what DT does on other platforms,
which modern systems do.

The way on these systems is to put a file in
drivers/platform/x86/* I think, but I know too little about
x86 for that.

I do think it'll be accepted upstream nevertheless, we do not
really count users but rather check whether the code is nice
and maintainable.

Yours,
Linus Walleij
