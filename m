From: Phil Reid <preid@electromag.com.au>
Subject: Re: pinctrl: mcp23s08: gpio-keys: Unable to get irq number for GPIO
Date: Thu, 21 Dec 2017 11:20:31 +0800
Message-ID: <8832ca04-49f6-0714-f629-8eb8e46e3e88@electromag.com.au>
References: <CALieaeeD6qmZTN6K9nH3C3psXd2r=z+x3k97EDOuAG8ra-AouQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy1.45ru.net.au ([203.30.46.145]:53281 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1756134AbdLUDUe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Dec 2017 22:20:34 -0500
In-Reply-To: <CALieaeeD6qmZTN6K9nH3C3psXd2r=z+x3k97EDOuAG8ra-AouQ@mail.gmail.com>
Content-Language: en-AU
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Mastykin <mastichi@gmail.com>, linux-gpio@vger.kernel.org

G'day Dmitry,
On 20/12/2017 22:44, Dmitry Mastykin wrote:
> Hello,
> 
> when using gpio-keys with mcp23s08, sometimes it fails to get irq numbers:
> 
> [   10.236393] gpiochip_setup_dev: registered GPIOs 504 to 511 on
> device: gpiochip4 (mcp23008)
> [   10.242995] of_get_named_gpiod_flags: parsed 'gpios' property of
> node '/keys/button@1[0]' - status (0)
> [   10.243759] gpio-keys keys: Unable to get irq number for GPIO 0, error -6
> 
> but more often it succeeds (approx. 1:3):
> 
> [   10.702204] gpiochip_setup_dev: registered GPIOs 504 to 511 on
> device: gpiochip4 (mcp23008)
> [   10.731450] of_get_named_gpiod_flags: parsed 'gpios' property of
> node '/keys/button@1[0]' - status (0)
> [   10.803577] of_get_named_gpiod_flags: parsed 'gpios' property of
> node '/keys/button@2[0]' - status (0)
> [   10.869131] of_get_named_gpiod_flags: parsed 'gpios' property of
> node '/keys/button@3[0]' - status (0)
> [   10.928949] of_get_named_gpiod_flags: parsed 'gpios' property of
> node '/keys/button@4[0]' - status (0)
> 
> Please suggest where could be the problem.

I have a pretty similar use mcp deive (serial 16bit) being used for gpio keypad.
Haven't seen any issues as yet.

Is the mcp irq setup succeeding, maybe add a log message to mcp23s08_irq_setup()

Maybe probe order related and on defer something is not getting cleaned up correctly?

One difference is:
mcp230xx_probe calls i2c_set_clientdata after mcp23s08_probe_one
mcp23s08_probe calls spi_set_drvdata before mcp23s08_probe_one


-- 
Regards
Phil Reid

