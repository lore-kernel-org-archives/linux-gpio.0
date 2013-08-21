From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V6 1/5] of: move documentation of of_parse_phandle_with_args
Date: Wed, 21 Aug 2013 11:47:41 -0600
Message-ID: <5214FD3D.5070102@wwwdotorg.org>
References: <1376515632-12594-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:37010 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751726Ab3HURro (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2013 13:47:44 -0400
In-Reply-To: <1376515632-12594-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@nvidia.com>

On 08/14/2013 03:27 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> Commit bd69f73 "of: Create function for counting number of phandles in
> a property" renamed of_parse_phandle_with_args(), and created a wrapper
> function that implemented the original name. However, the documentation
> of the original function was not moved, leaving it apparently documenting
> the newly renamed function.
> 
> Move the documentation so that it is adjacent to the function it
> documents.

Rob, Grant, does this series look OK now? Are you taking it through the
OF tree, or should Linus take it through the GPIO tree?
