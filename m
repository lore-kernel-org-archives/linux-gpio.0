Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C861248488C
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 09:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451155; cv=none; b=LGMNAwl1Vny0yPRLosO3inP3+l/y1UBKASJRLork74yuaTl74STbtq4TcrjgWAtoLY4LHGmdwDc9IqgSQ6KiL+DAYzq5js1AtxA8XAMn22Nv71QI1a9J7fnCLlW630N4//+SE0OPsdq0ityNCmQE3VGarRL0ci5Tr9Qdl3sY8OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451155; c=relaxed/simple;
	bh=tWZRu+UI2ZPuSpNn7BQgJfq8N/cVLqgDMRLvdJQv9Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fW+a0IOP0yL2tRV9DIlXNegszPlXnW6jpbtQQjd4cRhwAgE89ncNnBSa0gWkBSnSng3QeJSy+RRM8bWsw+afrp+AOl4mpbzKZPI9CtpI3WMTwRGkpaRgqCBRryPFCq8NiqgtG6gRMp7lQJcAqTgZm2ntGvfjuZThdafJmBNwwTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gi52uEHF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=POUEG3O/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gi52uEHF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="POUEG3O/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KLYJ1845507
	for <linux-gpio@vger.kernel.org>; Thu, 8 Oct 2026 09:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=k9oP5vnc7jHHYq8BmRPTcIkCBqaniiol+R2
	Q22c9X1o=; b=gi52uEHFBzWt79i2PfVboxj9Fz67CLvxfPGwLT1oIrWe47Da0AM
	zJoI9KtwFY6lyTpy5Q92HAKXLYWcnj7hWhuDMHPkNAH8VsPHfT19oQDPZv7sq4Yd
	FiUJoPuc6digpZgWJwNfX+Afmp+xB5UOMroYqQhQrzCKEpmApOvmEmmCQJYEeOYb
	yPcUO/AduRHF+DPKBoHe9uK9Rr/BLcje1ogUbr3Lc2XhlVdR+g39M0x0IEuXDRcn
	g1k+v32ZGYisJH9hjn7tCbrDFPnSKLpOMhvfSQsXsmS475PDg++1icpjuHlZ3W1I
	clPtZtiMt4SmuJMXvtBnQenF1eCWWknKOlQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3j7na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 09:19:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91786abb5abso86662196d6.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791451143; x=1792055943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9oP5vnc7jHHYq8BmRPTcIkCBqaniiol+R2Q22c9X1o=;
        b=POUEG3O/LI3Pr1D1DmY67Lpu+2vL0OkVLKkKQtJQn2kM9R6fsS6TmeK/5oU0Vty0RZ
         Daq4EvkPkLLHzDaEvbqYe/LGOsp3yerhraRbTiMWWeVynZMFlDPLmLC+8+5o50L0zY/p
         +Ek8V4ZnpEirwod6z9qfwlWn0Y0u3mWc9D48+scdkRObc1ffIwMa3bdJ2sBiN+xcnbVK
         JgSYmJgpjmTCKEgjFkwzqmvmU7kvnfUdslWPBnxpKtcg4BQo2x901zDn/tkEHRVWm+hN
         MJsMDvyPLU21QKovLwk8GqWhtoE/9LND5vxaxwt6B9Vcq+EDYlTyL9Xw2OB55/E91eW5
         s93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791451143; x=1792055943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9oP5vnc7jHHYq8BmRPTcIkCBqaniiol+R2Q22c9X1o=;
        b=pgjp5/D0RlaVEPXhFpFMeXj10O7a/uLrUfNBI/Vz/DtQSJ7YXFPYbJXtzNDdLKrWKA
         OfkGlTUrwFO9vCUuqPgishrZ1EDyDwjLQGSpVaiEpbsTYvUgR9FtB5rumnNbCNnDEQE1
         tweNJrrWTN9/fwXyp4Aucxr18tTkySP61RVKt97K9Ix02sdpO1mdjipzj+7gcGTWEg4k
         ZI1yPWHky8D4/2dXvi2HL+T31pVJWgnW0gXPurCUQ5+5Cuyzs0nY4S9C9zjhx5sHYcyf
         wt4BOzqvjlrrRWlJQzE1jgMfYCOGC85NaE4s1evg7SVHqvtNcqyVhIwJj89ceyH6gQnv
         hRIw==
X-Forwarded-Encrypted: i=1; AKwUvBzE5/nBrZ73UIuy1JUYwvbFS18MBy7efEoFW5St6xgJl4IenGJ8I67YsZtnut/YQsit0iAse4M5AFR0@vger.kernel.org
X-Gm-Message-State: AFuF++mPJ17enWG2eZ3Z9xjoQuSKvEw2seos5LsOe1fBF7jrTt815+w/
	EhaeyfzHZ8Eo+fVuEYy24d+kbC+5WRvBHmCiidClu/LQyYAxDbQ3XxOJXn0/z2bh94Akf0OCOjF
	v6Nil8UG7PmlSHPePoCeBFYwU2NEUEJ8KvdzRHV3G73p+p9QRZ8X0iM+00bSjONa9
X-Gm-Gg: AYBFou3+BgCERFlIT7kuzbMQA35NzZN3eJRbMEWvMZGQzPoi3CaZR8ms/WIthk+f/JX
	Ezw6Xc5DDoYELZxIzBF0Ewsw0y1okJMwfEiyoZUfTakZKPmprnGBX/ASdf6PPJHTSHuWrYYXBmT
	NMy0UwIx8k7OYM22mFdW2qluLaU7VGlugFgQaObIBWNUQbdlceHH4m8aJ2fD7TrbQZPZlMVm4qJ
	u9mCepbb2EIAiT3npee0wK8EsTXgD556XkUfhtJRkYKLsQi3tz+flq0HoTwYvN+03m+goWnrMWh
	9CU5sMx35ITcivk8rBopjZtolHslDidjZjLZRgKBOKXWioB2A6L0IQxZsPD4WNjXrutkLdj8xtd
	W/frJQptGqcLD7rnkcOFd813LwWKjO+SNnvd1GKeZIa45Eg==
X-Received: by 2002:a05:620a:2604:b0:93e:9898:c102 with SMTP id af79cd13be357-93e9b76ca27mr944191085a.20.1791451143526;
        Thu, 08 Oct 2026 02:19:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2604:b0:93e:9898:c102 with SMTP id af79cd13be357-93e9b76ca27mr944188085a.20.1791451143010;
        Thu, 08 Oct 2026 02:19:03 -0700 (PDT)
Received: from brgl-qcom.local (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843b2eadsm59975825e9.10.2026.10.08.02.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:19:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pin control updates for v7.4-rc1
Date: Thu,  8 Oct 2026 11:18:57 +0200
Message-ID: <20261008091857.5751-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX3wdUzEOPw0Nr
 hKnmCe7IFD7XZXPCAcAu/6t9xlwkDHjXJEqFvJsGa73kjhGcU6IxiieoMeWZbiUkggCkEV8RSvJ
 TCzRCDlArZVRucJktaYSDErnnELaQHU=
X-Proofpoint-ORIG-GUID: vfRejHnwysQp3LA4ZkEIKq9G4zcwj64d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX6m0Pk17ZYJoS
 hK7ZwekhwjLUoYMHpqS8xiGl2LjoqFKKmsDT9ZZgvggnQHOD2CJxPhsfoi6OYL6Q5NpPWNz9UQQ
 +CSzY9rcX4rPiwWLjYvwkwp3R2+lvgBd2Uc5sQw5x37Xab6+K0+QemmGmwOXJCKZD7cJyiRPyh2
 kwIKChIPtxz1PriW8O78LINh3+au9gssUsKpnBmbsAcE6lVBIYK19bOnIoqPSmJj8ixseBPZ+S7
 s8zlEmSo40/meAAZuPRo6OA9BrC7uaZApDEAdnENiisz1hBWyF40PxbXP8a3VegIaPPvIej8q9K
 pzjRd1NtkUm3v6VRB85EdKWB6PTlSMV34rko+XaclUd6DWeYJoBaPGidzAcRgyXiB1/NF3//7fN
 MIM+S8/9iLmljvCMgjKEUY5bbUOQ988ruinGvV7DDdr6WbVlsTd1L48Uqno8v03KVK+Rdwckucl
 2gcyAqGSkixgKqPgG1A==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac76008 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=s8qG-SC38XHMLUlfDbAA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: vfRejHnwysQp3LA4ZkEIKq9G4zcwj64d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Linus,

Please pull the following set of updates to Qualcomm pin control drivers for
the upcoming v7.4 merge window. There are three new drivers, support for a new
SPMI PMIC and some minor driver improvements along with necessary DT bindings
changes. Details are in the signed tag.

Thanks,
Bartosz

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-updates-for-v7.4-rc1

for you to fetch changes up to 4d7c9430a26aea6a69521af3aa2d78dd5bc8d3ed:

  pinctrl: qcom: tlmm-test: Add const to reg_names allocation type (2026-09-21 11:38:58 +0200)

----------------------------------------------------------------
Qualcomm pin control updates for v7.4-rc1

New drivers:
- add the TLMM drivers for Kuno and MSM8952
- add the LPASS LPI driver for Hawi

New model support:
- support PMAU0102 GPIO in pinctrl-spmi-gpio

Driver improvements:
- fix/unify naming convention in defines specific to Qualcomm pinctrl
  drivers
- extend debugfs verbosity for pinctrl-lpass-lpi
- make the return type from kcalloc() const in tlmm-test

Devicetree bindings:
- add binding documents for new drivers
- document compatibles for new models
- document the gpio-line-names property for qcom,sc8280xp-tlmm

----------------------------------------------------------------
Bjorn Andersson (1):
      pinctrl: qcom: lpass-lpi: Include value in debugfs output

Dhruvin Rajpura (2):
      dt-bindings: pinctrl: qcom,pmic-gpio: Document PMAU0102 GPIO support
      pinctrl: qcom: spmi-gpio: Add PMAU0102 GPIO support

Hardeep Sharma (2):
      dt-bindings: pinctrl: qcom: Add Kuno TLMM
      pinctrl: qcom: Add Kuno pinctrl driver

Kees Cook (1):
      pinctrl: qcom: tlmm-test: Add const to reg_names allocation type

Konrad Dybcio (1):
      pinctrl: qcom: Drop marketing name-prefixed duplicate defines

Muzaffer Kadir (2):
      dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl
      pinctrl: qcom: Add MSM8952 tlmm pinctrl driver

Prasad Kumpatla (2):
      dt-bindings: pinctrl: qcom,hawi-lpass-lpi-pinctrl: Add Hawi LPI pinctrl
      pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM

Xilin Wu (1):
      dt-bindings: pinctrl: qcom,sc8280xp-tlmm: allow gpio-line-names

 .../pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml       |  109 ++
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           |  110 ++
 .../bindings/pinctrl/qcom,msm8952-pinctrl.yaml     |  146 +++
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |    3 +
 .../bindings/pinctrl/qcom,sc8280xp-tlmm.yaml       |    3 +
 drivers/pinctrl/qcom/Kconfig                       |   10 +
 drivers/pinctrl/qcom/Kconfig.msm                   |   19 +
 drivers/pinctrl/qcom/Makefile                      |    3 +
 drivers/pinctrl/qcom/pinctrl-apq8064.c             |  188 +--
 drivers/pinctrl/qcom/pinctrl-apq8084.c             |  502 ++++----
 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c      |  244 ++++
 drivers/pinctrl/qcom/pinctrl-ipq4019.c             |  208 ++--
 drivers/pinctrl/qcom/pinctrl-ipq8064.c             |  208 ++--
 drivers/pinctrl/qcom/pinctrl-kuno.c                |  801 +++++++++++++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |    6 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |   17 +
 drivers/pinctrl/qcom/pinctrl-msm.h                 |   25 -
 drivers/pinctrl/qcom/pinctrl-msm8952.c             | 1257 ++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    1 +
 drivers/pinctrl/qcom/tlmm-test.c                   |    2 +-
 20 files changed, 3282 insertions(+), 580 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8952-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-kuno.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8952.c
