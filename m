From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/9] dt-bindings: interrupt-controller: add DT binding
 for meson GPIO interrupt controller
Date: Wed, 26 Oct 2016 16:42:35 -0500
Message-ID: <20161026214234.4q6wmecehqh6q32o@rob-hp-laptop>
References: <1476890480-8884-1-git-send-email-jbrunet@baylibre.com>
 <1476890480-8884-3-git-send-email-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35597 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932471AbcJZVmi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2016 17:42:38 -0400
Content-Disposition: inline
In-Reply-To: <1476890480-8884-3-git-send-email-jbrunet@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>

On Wed, Oct 19, 2016 at 05:21:13PM +0200, Jerome Brunet wrote:
> 
> This commit adds the device tree bindings description for Amlogic's GPIO
> interrupt controller available on the meson8, meson8b and gxbb SoC families
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> Rob, I did not include the Ack you gave for the RFC as bindings have slightly
> changed. Only the interrupt property has be removed following a discussion I
> had with Marc

As Mark R already said, you should keep the interrupts property.
