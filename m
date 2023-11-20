Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E2D3987B
	for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 22:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eH3HRIvS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A50C433C8;
	Mon, 20 Nov 2023 22:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700519317;
	bh=P7Ikg3vjIfBrorIC71X1iVZYfIZzCXg7zNTlT7wibWY=;
	h=From:To:Cc:Subject:Date:From;
	b=eH3HRIvSiAsR1b3Yhc+kCVy9spWUsvPgXogl0ZtH4NbppJqUWze8iOTz24pjvvCR1
	 b8qHy+mmUpLg6FDB0tWZ7znkwxEzNP0nlc+BiVwwH0HnX+47OAkSA0/DkYGqUSKvcg
	 XqHms7C69vF08+7M7oWd/MLP2zhGssBS1X7zvOgQsD3hqKySGTHTl5EfaeWK432E2d
	 /K81NTYC1qFOqPBrJ0EMw6PTrXg0a6/lqZM6Rm+cVWiwgV7qeVwbbXKDnNxzndB2RH
	 RToUK7TJp9ub5fUwhuUC/kusYgXpFRB6RW6kdfZ76g3o4BOR2x0+KDdbzU+WdyR2VA
	 Mu8MV6oWyJbTg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 0/2] pinctrl: pinconf-generic: clean up pinconf_parse_dt_config()
Date: Tue, 21 Nov 2023 07:28:30 +0900
Message-Id: <20231120222832.4063882-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit




Masahiro Yamada (2):
  pinctrl: pinconf-generic: resize the pin config array directly
  pinctrl: pinconf-generic: remove the special handling for no config
    case

 drivers/pinctrl/pinconf-generic.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

-- 
2.40.1

