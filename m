From: Phil Reid <preid@electromag.com.au>
Subject: gpio chrdev interface
Date: Fri, 28 Apr 2017 17:14:40 +0800
Message-ID: <e772cdac-e44b-27bf-32ab-93133b04fa8a@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy1.45ru.net.au ([203.30.46.145]:45590 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750761AbdD1JVY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Apr 2017 05:21:24 -0400
Content-Language: en-AU
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

G'day All,

In the device tree definition our hardwares GPIO I'd like to define some restictions on the gpio so the user space doesn't do anything dumb.
ie: if the pin is input only prevent the user space application making it an output etc.
Also specifying a initial state of high / low and output mode / polarity.
So forcing open collector output to all ways be open collector etc.
This then allows abstracting the gpio polarity mode etc to the hardware defintion and the user space application doesn't need to know
the details of the hardware implement.

gpio-hog setup seem to do something similar but then user space can't request the gpio.
I get a busy error when tryingt o talk to the gpio.

Am I missing something obvious?
Or is this not catered for at the moment?
Is not is it something worth considering?

Regards
Phil


