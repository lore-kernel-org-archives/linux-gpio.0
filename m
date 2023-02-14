Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95ECC61DA4
	for <linux-gpio@archiver.kernel.org>; Tue, 14 Feb 2023 08:28:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbjBNI2O (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 14 Feb 2023 03:28:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjBNI2O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Feb 2023 03:28:14 -0500
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A2EA3C29;
        Tue, 14 Feb 2023 00:28:13 -0800 (PST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.3ffe.de (Postfix) with ESMTPSA id ABCBD1235;
        Tue, 14 Feb 2023 09:28:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
        t=1676363291;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/s4hBUqQ3LtC1I5ckLCv4EpQlZH3IqyrIsPh7PQ9+dE=;
        b=owIcbW2qWwec/5TkB2wNXgO/S+QQim4McxSTh/0LStmJy6oyfYo0vGy6wyVrwhQevDYPBG
        lYiI+j4UVkjl+pymmT0JektN51aq5i4N6vUojFS6PpOXq6C0vpPx3IXXk4Sclil9H8njwY
        nQUTUJTlVdQ+odwzpIQy5PUepLESAghzBtu8wKCcU7WPNKfWGPRp1KpWJLGPOOykDDGYxP
        d/G+wuaF8AZ1y2WPoRke2reX4AUHWaAFaK04l/BEftFO1Ym2xxFZroeTk9+AUczOu5dLCx
        cbJqnRzoIwapk4GLvXnSzDjTqpUrZn+wEwHSUo0shY1A79PvaZUuUXhBqEU60w==
From:   Michael Walle <michael@walle.cc>
To:     tharunkumar.pasumarthi@microchip.com
Cc:     UNGLinuxDriver@microchip.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v5 char-misc-next] misc: microchip: pci1xxxx: Add OTP/EEPROM driver for the pci1xxxx switch
Date:   Tue, 14 Feb 2023 09:28:04 +0100
Message-Id: <20230214082804.2761756-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230212035743.231353-1-tharunkumar.pasumarthi@microchip.com>
References: <20230212035743.231353-1-tharunkumar.pasumarthi@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Microchip's pci1xxxx is an unmanaged PCIe3.1a switch for consumer, industrial,
> and automotive applications. This switch integrates OTP and EEPROM to enable
> customization of the part in the field. This patch provides the OTP/EEPROM
> driver to support the same.

Why isn't this driver using the nvmem subsystem which is usually used for
OTP and EEPROM?

-michael
