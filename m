From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2] pinctrl: Don't create a pinctrl handle if no pinctrl
 entries exist
Date: Sat, 18 Jun 2016 10:44:22 +0200
Message-ID: <CACRpkdYvViBkjsvtPuhujpDGi6Z3CMmv8Z8-Vb_y8Xcs=XVOnw@mail.gmail.com>
References: <1466090861-4538-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:34193 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751131AbcFRIoX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jun 2016 04:44:23 -0400
Received: by mail-oi0-f43.google.com with SMTP id d132so148448734oig.1
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jun 2016 01:44:23 -0700 (PDT)
In-Reply-To: <1466090861-4538-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jun 16, 2016 at 5:27 PM, Jon Hunter <jonathanh@nvidia.com> wrote:

> When pinctrl_get() is called for a device, it will return a valid handle
> even if the device itself has no pinctrl state entries defined in
> device-tree. This is caused by the function pinctrl_dt_to_map() which
> will return success even if the first pinctrl state, 'pinctrl-0', is not
> found in the device-tree node for a device.
>
> According to the pinctrl device-tree binding documentation, pinctrl
> states must be numbered starting from 0 and so 'pinctrl-0' should always
> be present if a device uses pinctrl and therefore, if 'pinctrl-0' is not
> present it seems valid that we should not return a valid pinctrl handle.
>
> Fix this by returning an error code if the property 'pinctrl-0' is not
> present for a device.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Patch applied (after adding OF to the subject)

It's a bit dangerous because it changes semantics but let's see
if we survive it.

> I was wondering if this meant we are creating pinctrl handles for
> devices on boot that don't use pinctrl (when
> calling pinctrl_bind_pins()). However, although devm_pinctrl_get()
> does return successful for all devices, the subsequent call to
> pinctrl_lookup_state() (to get the default state) will fail and so
> we will destroy the pinctrl handle afterall.

It's better like this, logically. I'm just worried that there may be
code in the tree that depend on the bind always getting a handle.

Yours,
Linus Walleij
