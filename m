From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: Add Spreadtrum GPIO controller
 documentation
Date: Mon, 5 Feb 2018 00:09:08 -0600
Message-ID: <20180205060908.k44rxxacfw5bi25z@rob-hp-laptop>
References: <2834309f69a1ec37b84a33f153a3d0b90336bcc6.1517453568.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:45203 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752918AbeBEGJL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Feb 2018 01:09:11 -0500
Content-Disposition: inline
In-Reply-To: <2834309f69a1ec37b84a33f153a3d0b90336bcc6.1517453568.git.baolin.wang@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org

On Thu, Feb 01, 2018 at 11:04:31AM +0800, Baolin Wang wrote:
> This patch adds the device tree bindings for the Spreadtrum
> GPIO controller. The gpios will be supported by the GPIO
> generic library.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
> Changes since v1:
>  - No updates.
> ---
>  .../devicetree/bindings/gpio/gpio-sprd.txt         |   28 ++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sprd.txt

Reviewed-by: Rob Herring <robh@kernel.org>

