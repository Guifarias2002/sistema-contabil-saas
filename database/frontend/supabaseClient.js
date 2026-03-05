import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://cunwgepjcjxechwtbhur.supabase.co'
const supabaseKey = 'sb_publishable_EOU5W_dyJkVrg8oy5UT55g_6uiQSnpi'

export const supabase = createClient(supabaseUrl, supabaseKey)
