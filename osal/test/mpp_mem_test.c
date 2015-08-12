/*
 * Copyright 2010 Rockchip Electronics S.LSI Co. LTD
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define MODULE_TAG "mpp_malloc_test"

#include "mpp_log.h"
#include "mpp_env.h"
#include "mpp_mem.h"

// TODO: need to add pressure test case and parameter scan case

int main()
{
    void *tmp = NULL;

    mpp_set_env_u32("osal_mem_list", 1);
    tmp = mpp_malloc(int, 100);
    if (tmp) {
        mpp_log("malloc success\n");
        mpp_free(tmp);
    } else {
        mpp_log("malloc failed\n");
    }

    return 0;
}