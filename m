Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971903;
	b=eZINSom3Z8DnfBptbXI5OYRNfCyN8Rj+SvBxzEqcfs9kEYxEkIlj++yxvMeeS1UaF2Gh
	 Ip56YOZJg+fqISD0bfoAZ4SgUmzGq64heDKJyLYeCIWXUBKOtgaiFK2ZSkU8lvnIPfEDd
	 d/X8rnhB+TJzWuYnReYGhVPZmQyDjrQQ4NYJWAuPUE3yQ/TCG45LHvicT0+4oDdbcx2YB
	 NOX8xlZjdUxDxQZ9K6bp85YsEtJnEzrZ72lBZPQE6QgbHJZpMEQEe4sSyCTZ9yz8fs+e0
	 bpCBWjXoOEIprJBC5zESBss5aWSKsSzTQsh4DW5rIVxSoi+A6MtiJBhWpbnTBMQQnTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971903;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=VvZmj0RZ6Y0bV/owPEjvnUNIaIep4zjJX7GARLr8Q7I=;
	b=2ixwg8cO/VjuAK2M2AsSHfRdvScrngvDNECGzj6u7BmvWwp6OD8fqfNYNN4Din76YKxE
	 bNpyraDmzJQ6WDgre9KRqhlZTOQh1g8rauZDjUwH73vKjZRZ9gkIAsx20D50czUg8jGlc
	 alJ0HmvK6U88Us71L8x3ZZIse9vj1JqK6lIucUTsfW1Q9xH/Z4dAQOyuoqFCZFbICftcS
	 0lCscNItGcVOHxf/jWWmgbXeqltwUOG8CopdVis00gxXkvmU5tJPCl+OPk8HrC4Iy6r+x
	 C0kKUmWb1Y0ySQUuvi8++yrpy1mGGTQ8NpsjzdIf1R8ZrR+f9uZf7bVxbZ5tP+uASxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J3rrxPoq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B159606A329
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J3rrxPoq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DD11F0089F
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971902;
	bh=VvZmj0RZ6Y0bV/owPEjvnUNIaIep4zjJX7GARLr8Q7I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=J3rrxPoqCirEyT/mJ2GjbSTHv8wAGnJ1/pJpHH8UctQNYrfI6VRDgb+O3QvzHyQEH
	 1g/qw8HrDHUsOMoZkeT2aKer6w8fDVLZDdVLeEODkdyXQ4t91rVtLlCMR8D40Nu/hT
	 pQgXlxVFbHIdOzAySa2q8Np8LW6Ht9waVn9x6dPhloVPfFilVAeKrtDb66KD9W1g6U
	 VeWKv3+v50zpuLjlPxpoe/YoAugBfDSe9cbjy7enfslRq+kmR5LaRUUDD+VoY3UM4r
	 sPxDZu3Iq9yA6bPijCGamL2fqBVW8GF8B50s8cRA8Mcre1c211Y47wpvzznQF3unPC
	 bfOoskwOesm5A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so556694e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 05:31:42 -0800 (PST)
X-Gm-Message-State: APuU4Z8HRyBsSEYxLzUASVmC1Q7PgaXcaFsaTmee/Ro0ROErHaQ26PwK
	Xwp1H/rv2cHqu6/DzDkLFMLI3qPTkQgXraC0TpCFgEWz3HT/OAXwC4gBnHSsomfdVwsHomrJqfI
	B6BQ7jRwok3E5Lju5dXpddeVWXWMUvvk=
X-Received: by 2002:a05:6512:3e0d:b0:5bf:b7d2:c7d3 with SMTP id
 2adb3069b0e04-5c003c1dd06mr786520e87.39.1793971901418; Fri, 06 Nov 2026
 05:31:41 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-superm1-pinctrl-maintainers-entry-v1-1-c4cadcfbd984@amd.com>
In-Reply-To: <20261105-superm1-pinctrl-maintainers-entry-v1-1-c4cadcfbd984@amd.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:31:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLmtETeQqT6TFdui4+eiLrKNvRW_fdOTBQMgM_Vn0Ribhw@mail.gmail.com>
X-Gm-Features: AclHuK8B1tM5UNXp1ov6mWPY-0W7hdExHUabApyswqYyIkMddSr-lboYm3SEn28
Message-ID: <CAD++jLmtETeQqT6TFdui4+eiLrKNvRW_fdOTBQMgM_Vn0Ribhw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add a review entry for pinctrl-amd for me
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 7:01=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> I've been looking and submitting patches for a while, I may as well
> be looped in on patches too.
>
> Suggested-by: Linus Walleij <linusw@kernel.org>
> Link: https://lore.kernel.org/linux-gpio/CAD++jLkRYb1Pn2G=3DcP2yGkSFbuHhz=
RQ-fDbTygmpxbCsm-02gw@mail.gmail.com/
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Excellent, thanks.
Patch applied!

Yours,
Linus Walleij
