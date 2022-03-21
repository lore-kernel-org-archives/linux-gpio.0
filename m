Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C681C433EF
	for <linux-gpio@archiver.kernel.org>; Mon, 21 Mar 2022 13:34:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347937AbiCUNgG (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 21 Mar 2022 09:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347963AbiCUNfx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Mar 2022 09:35:53 -0400
Received: from mail.thorsis.com (mail.thorsis.com [92.198.35.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E69EA3EABB
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 06:34:19 -0700 (PDT)
Date:   Mon, 21 Mar 2022 14:34:12 +0100
From:   Alexander Dahl <ada@thorsis.com>
To:     Hans Kurscheidt <lve0200@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: gpiod: Set pullup for Input Line
Message-ID: <Yjh+1DbmLoKGtIE8@ada.ifak-system.com>
Mail-Followup-To: Hans Kurscheidt <lve0200@gmail.com>,
        linux-gpio@vger.kernel.org
References: <97da941f-39da-4ded-0138-d1e71c4d3ecc@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97da941f-39da-4ded-0138-d1e71c4d3ecc@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Hans,

Am Mon, Mar 21, 2022 at 11:43:45AM +0100 schrieb Hans Kurscheidt:
> Despite deep searching, I cannot find any information, if gpiod allow
> specifying pull-ups to input lines and how to do/handle it.

This is usually something described in device tree.  Or do you have a
use case for changing it at runtime?

Greets
Alex

