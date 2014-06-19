From: Rob Jones <rob.jones@codethink.co.uk>
Subject: Change gpio-reulator-probe() to use managed resources.
Date: Thu, 19 Jun 2014 16:46:01 +0100
Message-ID: <1403192765-3258-1-git-send-email-rob.jones@codethink.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ducie-dc1.codethink.co.uk ([185.25.241.215]:56683 "EHLO
	ducie-dc1.codethink.co.uk" rhost-flags-OK-FAIL-OK-FAIL)
	by vger.kernel.org with ESMTP id S1757143AbaFSPqZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 19 Jun 2014 11:46:25 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel@codethink.co.uk, ian.molton@codethink.co.uk, ben.dooks@codethink.co.uk, heiko@sntech.de, rob.jones@codethink.co.uk

Add new managed resource functions as needed to achieve this.

Amend the following functions:

devm_kstrdup()
gpio_regulator_probe()

Add the following functions:

devm_kmemdup()
devm_gpio_request_array()
devm_gpio_free_array()

Remove the following functions:

gpio_regulator_remove()


>From Rob Jones <rob.jones@codethink.co.uk> # This line is ignored.
From: Rob Jones <rob.jones@codethink.co.uk>
Subject: 
In-Reply-To: 

