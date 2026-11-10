Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794306475;
	b=aQ1FSi0E0XUGSjoTodIPOAOIrzwYTZEbf0rugZopeCbMsbMX57DPBc+seD5J4y7c2a/m
	 7HN0cjzJ+DH1bIaaRDkd/Ny8CGfPeYNGS027Nj94HAwEKCRbyKghZRWqyaCm7LOOxtxOt
	 01BAkrVaMSnqd3QB1aqN4J5w0aldFlZlGu+iXPd6ScpMFEUzgSjNcTgJRdIiZewB3lcgl
	 RjCTHTWZl+ILlkd8/OjodcsnUkRmCZG4d2Pw0UaUmlTuNBZAfXdmfpHR44BS+/aVRpTb/
	 dBt7RCVpM/FPCB9hM3UvFFlnGcZa39mNTuNNOb5KlylMYQRVtSKhmeXvjet8kjBGfhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306475;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=3Rc6Ro7bev2lB0U+4JqWHjc10l4sUHoK3bqnfNloXx8=;
	b=RJSTKO2CAyJv7MfwJy4/QiInEfidswAN4htqsqhfVrYQrkjx2JkxhAzBEBz7zuN+Dl8J
	 2mnaT9+NjEOHCPDQQ5LMWI7JB3z+wI5s9EueIEh1XWr79g/YEGPS6TWQefJrRzr05yNJq
	 jiZ4dpBFK9Hmqb0kL2LGUXj1X5P1s2NlU4wjZMugj7oOfotAbQoRPuepMsrA+F9moMdtD
	 wXTvr91MZfwtHwsbucnoGPnuDBKPyAPz/EiiryNuon7hoGf79pW0W99QmzPLUryvhZ2tH
	 QTVKTyKwAAlFi30KsvD9IhjD1fAIkqR7ZpwzE9dn5Y3WUwVFMqCUHPzW7t21p7JjlzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dhO40is0;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6EE606A321;
	Tue, 10 Nov 2026 10:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F6EE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dhO40is0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FD531516;
	Tue, 10 Nov 2026 02:27:50 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A12A3F85F;
	Tue, 10 Nov 2026 02:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794306473; bh=h8QVGE2a8BaTvad9cRrQL3prndITmd2HwMRRAfN5+/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dhO40is0FGV6jMBwBRZCCuFb7BdEPIbAic0Nii6l/ItyAeUNo9kBIH1g21Ecla85e
	 TXv87uU9PTKJPDv9/j15VoYTdRJqlkBRsXd+AA1SzT4nwh8BJW+P55YW8zen6rjJvC
	 2Y3cWo1tQ9RsCbmPGDSU8YMNsGhaikrUYGImkpD4=
Date: Tue, 10 Nov 2026 10:27:49 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/11] firmware: arm_scmi: stop reading past
 PINCTRL_LIST_ASSOCIATIONS replies
Message-ID: <avLxpUd6cXuqUCbd@pluto>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-5-52d92843ad97@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-5-52d92843ad97@baylibre.com>

On Fri, Oct 30, 2026 at 04:58:36PM +0100, Clément Le Goffic wrote:
> The transport cuts a reply larger than the receive buffer, but the iterator
> still reads every identifier the reply announces. Use only the identifiers
> that were copied and ask again for the others.

Hi Clement,

thanks for these fixes...I'll start from this since it really intersects
my current work....

> 
> Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---
>  drivers/firmware/arm_scmi/pinctrl.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
> index 42cb1aef1fe1..69645ce73d9d 100644
> --- a/drivers/firmware/arm_scmi/pinctrl.c
> +++ b/drivers/firmware/arm_scmi/pinctrl.c
> @@ -261,10 +261,22 @@ static int iter_pinctrl_assoc_update_state(struct scmi_iterator_state *st,
>  					   const void *response, void *priv)
>  {
>  	const struct scmi_resp_pinctrl_list_assoc *r = response;
> +	unsigned int nr_fit = 0;
>  
>  	st->num_returned = RETURNED(r->flags);
>  	st->num_remaining = REMAINING(r->flags);
>  
> +	if (st->rx_len > sizeof(*r))
> +		nr_fit = (st->rx_len - sizeof(*r)) / sizeof(r->array[0]);

As Sashiko kindly pointed out to me a few other zillion times O_o in my
Telemetry series, there were a couple of missing sanity checks in the
iterators core so in my last series there is upfront a generic fix

https://lore.kernel.org/arm-scmi/avLTkAtQQSzpgu2A@pluto/T/#me258191dd55db99d53b570be7c51901c31bc70cf

...so we could at least avoid to check here and everywhere else in SCMI
iterators that you have at least a minimum size messages to work on.

> +
> +	if (st->num_returned > nr_fit) {
> +		if (!nr_fit)
> +			return -EPROTO;

My core fix above will discard the iteration upfront in an equivalent way
to this check togateher with the rx_len check above If I get this wrong...BUT..

> +
> +		st->num_remaining += st->num_returned - nr_fit;
> +		st->num_returned = nr_fit;

...why are you fixing and carry on ?
I dont feel that you can safely proceed at this point by just fixing the
returned and the remaining...

...the check is of course needed, but it should be an hard check

	if (st->rx_len < (sizeof(*r) + sizeof(r->array[0]) * st->num_returned))   
                return -EINVAL;

...because something is clearly wrong...indeed, learning from my current
telemetry madness the above scenario could be due not only to a buggy FW
BUT more easily to a misconfigured transport...if the transport size is
misconfigured (as it is mostly NOT negotiated, simply configured) any
message long enough will be silently truncated, so the fact especially
that you guess remaining it can happen to be completely out of sync with
the platform side...

Are you fixing an existent known FW bug here ? in that case I would opt
for a quirk...

Thanks,
Cristian
