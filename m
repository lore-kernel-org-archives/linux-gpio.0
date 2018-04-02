From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 1/2] pinctrl: qcom: remove static globals to allow
 multiple TLMMs
Date: Mon, 2 Apr 2018 15:52:45 -0500
Message-ID: <5133ffa9-0033-249d-ea46-b8972b6e07ac@codeaurora.org>
References: <1521848700-22214-1-git-send-email-timur@codeaurora.org>
 <CACRpkdZ=z7EncPykPwK+m-_qM3J2PokmkcoKsRqao_X1qx7CSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZ=z7EncPykPwK+m-_qM3J2PokmkcoKsRqao_X1qx7CSg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On 03/27/2018 08:33 AM, Linus Walleij wrote:
>> Two data structures are declared as static globals but are intended to
>> be per-TLMM.  Move them into the msm_pinctrl structure and initialize
>> them at runtime.
>>
>> Signed-off-by: Timur Tabi <timur@codeaurora.org>

> Waiting for a review from Stephen or Bjorn on these two
> patches.

Stephen? Bjorn?  I really hope I don't miss the 4.17 release.  I've been 
working on these patches for months.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
