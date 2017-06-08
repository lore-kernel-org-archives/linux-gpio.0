From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 02/17] mfd: madera: Add DT bindings for Cirrus Logic
 Madera codecs
Date: Thu, 8 Jun 2017 14:12:52 -0500
Message-ID: <20170608191252.enk4bmxibnum24ni@rob-hp-laptop>
References: <1496415790-19164-1-git-send-email-rf@opensource.wolfsonmicro.com>
 <1496415790-19164-3-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:35924 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751448AbdFHTMy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jun 2017 15:12:54 -0400
Content-Disposition: inline
In-Reply-To: <1496415790-19164-3-git-send-email-rf@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Cc: lee.jones@linaro.org, broonie@kernel.org, linus.walleij@linaro.org, gnurou@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, alsa-devel@alsa-project.org, patches@opensource.wolfsonmicro.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jun 02, 2017 at 04:02:55PM +0100, Richard Fitzgerald wrote:
> Specification of the bindings for the parent MFD driver component
> of the Cirrus Logic Madera codec drivers.
> 
> Note that although the interrupt controller and GPIO are child
> drivers their required bindings are trivial, mandatory, and exist
> within the parent MFD node so are documented here.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
> ---
> Changes since V2:
> - Moved the gpio driver bindings into the main MFD binding doc
> 
>  Documentation/devicetree/bindings/mfd/madera.txt | 102 +++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/madera.txt

Acked-by: Rob Herring <robh@kernel.org>
